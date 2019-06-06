using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Clippr.Communication;
using Clippr.Domain;
using Clippr.Infrastructure.Interfaces;
using Grpc.Core;
using MediatR;

namespace Clippr.Application.Commands.DeleteClipboardEntryCommand
{
    public class DeleteClipboardEntryCommandHandler : IRequestHandler<DeleteClipboardEntryRequest, bool>
    {
        private readonly IClipboardEntityContext _entityContext;
        private readonly IClipboardBroadcasterService _broadcasterService;
        private readonly IMapper _mapper;

        public DeleteClipboardEntryCommandHandler(IClipboardEntityContext entityContext,
            IClipboardBroadcasterService broadcasterService, IMapper mapper)
        {
            _entityContext = entityContext;
            _broadcasterService = broadcasterService;
            _mapper = mapper;
        }

        public async Task<bool> Handle(DeleteClipboardEntryRequest request, CancellationToken cancellationToken)
        {
            var entity = await _entityContext.GetById(request.Id);
            if (entity == null)
                return false;

            var isDeleted = await _entityContext.Delete(request.Id);
            if (!isDeleted)
                throw new RpcException(new Status(StatusCode.Unknown,
                    $"Failed deleting clipboard entry with Id {request.Id}"));

            var entry = _mapper.Map<ClipboardEntryDto, ClipboardEntry>(entity);

            _broadcasterService.AddClipboardEntry(new ClipboardEntryMessage
                {ClipboardEntry = entry, ClipboardUpdateType = ClipboardUpdateType.Deleted});

            return true;
        }
    }
}