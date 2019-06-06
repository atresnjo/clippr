using MongoDB.Bson;

namespace Clippr.Domain
{
    public interface IEntity
    {
        ObjectId Id { get; set; }
    }
}