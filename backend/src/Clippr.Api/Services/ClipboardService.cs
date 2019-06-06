using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Clippr.Application.Commands.CreateClipboardEntryCommand;
using Clippr.Application.Commands.DeleteClipboardEntryCommand;
using Clippr.Application.Commands.GetClipboardEntryCommand;
using Clippr.Communication;
using Clippr.Domain;
using Clippr.Infrastructure.Interfaces;
using Grpc.Core;
using MediatR;
using MongoDB.Bson;

namespace Clippr.Api.Services
{
    public class ClipboardService : Clipboard.ClipboardBase
    {
        private readonly IMediator _mediator;
        private readonly IClipboardBroadcasterService _service;
        private readonly IMapper _mapper;

        public ClipboardService(IMediator mediator, IClipboardBroadcasterService service, IMapper mapper)
        {
            _mediator = mediator;
            _service = service;
            _mapper = mapper;
        }

        public override async Task<DeleteReply> Delete(DeleteRequest request, ServerCallContext context)
        {
            var reply = await _mediator.Send(new DeleteClipboardEntryRequest(ObjectId.Parse(request.Id)));
            return new DeleteReply {Response = reply};
        }

        public override async Task<FetchReply> Fetch(FetchRequest request, ServerCallContext context)
        {
            var reply = (await _mediator.Send(new GetClipboardEntryCommandRequest())).ToList();
            var fetchReply = new FetchReply();
            foreach (var clipboardEntry in reply)
            {
                var entity = _mapper.Map<ClipboardEntryDto, ClipboardEntry>(clipboardEntry);
                fetchReply.ClipboardEntries.Add(entity);
            }

            return fetchReply;
        }

        public override async Task<CreateReply> Create(CreateRequest request, ServerCallContext context)
        {
            var reply = await _mediator.Send(new CreateClipboardEntryCommandRequest(request));
            return new CreateReply {Response = reply};
        }

        public override async Task ClipboardUpdate(RegisterConnection request,
            IServerStreamWriter<ClipboardEntryMessage> responseStream, ServerCallContext context)
        {
            _service.AddDevice(request.DeviceName, new BroadcasterServiceData(responseStream, context));
            await Task.Run(async () =>
            {
                context.CancellationToken.Register(() => { _service.RemoveDevice(request.DeviceName); });
                while (true)
                {
                    await Task.Delay(50);
                }
            });
        }
    }
}