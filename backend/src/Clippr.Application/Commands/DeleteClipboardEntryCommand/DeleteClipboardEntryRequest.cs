using System;
using MediatR;
using MongoDB.Bson;

namespace Clippr.Application.Commands.DeleteClipboardEntryCommand
{
    public class DeleteClipboardEntryRequest : IRequest<bool>
    {
        public ObjectId Id { get; set; }

        public DeleteClipboardEntryRequest(ObjectId id)
        {
            Id = id;
        }
    }
}