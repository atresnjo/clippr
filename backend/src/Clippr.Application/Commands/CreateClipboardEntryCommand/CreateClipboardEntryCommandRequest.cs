using Clippr.Communication;
using MediatR;

namespace Clippr.Application.Commands.CreateClipboardEntryCommand
{
    public class CreateClipboardEntryCommandRequest : IRequest<bool>
    {
        public CreateRequest Request { get; set; }

        public CreateClipboardEntryCommandRequest(CreateRequest request)
        {
            Request = request;
        }
    }
}