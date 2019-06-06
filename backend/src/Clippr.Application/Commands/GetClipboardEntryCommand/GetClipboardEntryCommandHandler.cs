using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Clippr.Domain;
using Clippr.Infrastructure.Interfaces;
using MediatR;

namespace Clippr.Application.Commands.GetClipboardEntryCommand
{
    public class GetClipboardEntryCommandHandler : IRequestHandler<GetClipboardEntryCommandRequest, IEnumerable<ClipboardEntryDto>>
    {
        private readonly IClipboardEntityContext _clipboardEntityContext;

        public GetClipboardEntryCommandHandler(IClipboardEntityContext clipboardEntityContext)
        {
            _clipboardEntityContext = clipboardEntityContext;
        }

        public async Task<IEnumerable<ClipboardEntryDto>> Handle(GetClipboardEntryCommandRequest request,
            CancellationToken cancellationToken)
        {
            return await _clipboardEntityContext.GetMany(request.QueryExpression);
        }
    }
}