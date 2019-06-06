using System;
using System.Collections.Concurrent;
using System.Threading.Tasks;
using Clippr.Communication;
using Clippr.Domain;
using Clippr.Infrastructure.Interfaces;
using Grpc.Core;
using Microsoft.Extensions.Logging;

namespace Clippr.Api.Services
{
    public class ClipboardBroadcasterService : IClipboardBroadcasterService
    {
        private readonly ILogger<ClipboardBroadcasterService> _logger;
        private readonly ConcurrentDictionary<string, BroadcasterServiceData> _connectedDevices;
        private readonly BlockingCollection<ClipboardEntryMessage> _clipboardBroadcastQueue;

        public ClipboardBroadcasterService(ILogger<ClipboardBroadcasterService> logger)
        {
            _logger = logger;
            _connectedDevices = new ConcurrentDictionary<string, BroadcasterServiceData>();
            _clipboardBroadcastQueue = new BlockingCollection<ClipboardEntryMessage>();
        }

        public void AddDevice(string deviceName, BroadcasterServiceData serviceData)
        {
            _logger.LogInformation($"Trying to add device '{deviceName}'");
            if (_connectedDevices.ContainsKey(deviceName))
            {
                var errorMessage = $"Device '{deviceName}' already exists";
                _logger.LogError(errorMessage);
                throw new RpcException(new Status(StatusCode.NotFound, errorMessage));
            }

            var added = _connectedDevices.TryAdd(deviceName, serviceData);
            _logger.LogInformation(added
                ? $"Device '{deviceName}' was successfully added"
                : $"Failed adding device '{deviceName}'");
        }

        public void RemoveDevice(string deviceName)
        {
            _logger.LogInformation($"Trying to remove device '{deviceName}'");
            if (!_connectedDevices.ContainsKey(deviceName))
            {
                var errorMessage = $"Device '{deviceName}' does not exist";
                _logger.LogError(errorMessage);
                throw new RpcException(new Status(StatusCode.NotFound, errorMessage));
            }

            var removed = _connectedDevices.TryRemove(deviceName, out _);
            _logger.LogInformation(removed
                ? $"Device '{deviceName}' was successfully removed"
                : $"Failed removing device '{deviceName}'");
        }

        public void AddClipboardEntry(ClipboardEntryMessage clipboardEntryMessage)
        {
            _logger.LogInformation("A new clipboard entry has been added");
            _clipboardBroadcastQueue.Add(clipboardEntryMessage);
        }

        public async Task Start()
        {
            await Task.Run(async () =>
            {
                while (true)
                {
                    var clipboardEvent = _clipboardBroadcastQueue.Take();
                    foreach (var (device, connection) in _connectedDevices)
                    {
                        try
                        {
                            _logger.LogInformation(
                                $"Broadcasting update to {device} type {clipboardEvent.ClipboardUpdateType} with id {clipboardEvent.ClipboardEntry.Id}");

                            await connection.ServerStreamWriter.WriteAsync(clipboardEvent);
                        }
                        catch (Exception ex)
                        {
                            _logger.LogError($"Error while broadcasting content to device '{device}' - {ex}");
                            RemoveDevice(device);
                        }
                    }
                }
            });
        }
    }
}