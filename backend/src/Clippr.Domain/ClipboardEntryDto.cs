using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Clippr.Domain
{
    [BsonIgnoreExtraElements]
    public class ClipboardEntryDto : IEntity
    {
        [BsonId] public ObjectId Id { get; set; }
        public string Content { get; set; }
        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; }

        public ClipboardEntryDto(string content, string createdBy)
        {
            Content = content;
            CreatedBy = createdBy;
            CreatedAt = DateTime.Now;
        }
    }
}