using Clippr.Domain;
using MongoDB.Driver;

namespace Clippr.Infrastructure.Context
{
    public class MongoContext
    {
        private readonly IMongoDatabase _database;

        public MongoContext()
        {
            var client = new MongoClient("mongodb://localhost:27017");
            _database = client.GetDatabase("clippr");
        }

        public IMongoCollection<ClipboardEntryDto> ClipboardData => _database.GetCollection<ClipboardEntryDto>("clipboardEntity");
    }
}