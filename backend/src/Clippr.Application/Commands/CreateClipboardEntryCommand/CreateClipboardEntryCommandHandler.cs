using System.Globalization;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Clippr.Communication;
using Clippr.Domain;
using Clippr.Infrastructure.Interfaces;
using Grpc.Core;
using MediatR;

namespace Clippr.Application.Commands.CreateClipboardEntryCommand
{
    public class CreateClipboardEntryCommandHandler : IRequestHandler<CreateClipboardEntryCommandRequest, bool>
    {
        private readonly IClipboardEntityContext _clipboardEntityContext;
        private readonly IClipboardBroadcasterService _broadcasterService;
        private readonly IMapper _mapper;

        public CreateClipboardEntryCommandHandler(IClipboardEntityContext clipboardEntityContext, IClipboardBroadcasterService broadcasterService, IMapper mapper)
        {
            _clipboardEntityContext = clipboardEntityContext;
            _broadcasterService = broadcasterService;
            _mapper = mapper;
        }

        public async Task<bool> Handle(CreateClipboardEntryCommandRequest request, CancellationToken cancellationToken)
        {
            var entity =
                await _clipboardEntityContext.Create(new ClipboardEntryDto(request.Request.Content,
                    request.Request.CreatedBy));

            if (entity == null)
                throw new RpcException(new Status(StatusCode.Unknown, "Failed creating clipboard entry"));

            var entry = _mapper.Map<ClipboardEntryDto, ClipboardEntry>(entity);

            _broadcasterService.AddClipboardEntry(new ClipboardEntryMessage
                {ClipboardEntry = entry, ClipboardUpdateType = ClipboardUpdateType.Created});

            return true;
        }
    }
}