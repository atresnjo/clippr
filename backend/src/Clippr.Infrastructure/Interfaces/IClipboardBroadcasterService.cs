using System.Threading.Tasks;
using Clippr.Communication;
using Clippr.Domain;

namespace Clippr.Infrastructure.Interfaces
{
    public interface IClipboardBroadcasterService
    {
        void AddDevice(string deviceName, BroadcasterServiceData serviceData);
        Task Start();
        void RemoveDevice(string deviceName);
        void AddClipboardEntry(ClipboardEntryMessage clipboardEntryMessage);
    }
}