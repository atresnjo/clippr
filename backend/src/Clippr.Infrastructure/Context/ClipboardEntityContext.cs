using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Clippr.Domain;
using Clippr.Infrastructure.Interfaces;
using MongoDB.Bson;
using MongoDB.Driver;

namespace Clippr.Infrastructure.Context
{
    public class ClipboardEntityContext : IClipboardEntityContext
    {
        private readonly MongoContext _databaseContext;

        public ClipboardEntityContext(MongoContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public async Task<IEnumerable<ClipboardEntryDto>> GetMany(
            Expression<Func<ClipboardEntryDto, bool>> expression = null)
        {
            if (expression == null)
                return (await _databaseContext.ClipboardData.FindAsync(x => true)).ToList();

            return (await _databaseContext.ClipboardData.FindAsync(expression)).ToList();
        }

        public async Task<ClipboardEntryDto> GetById(ObjectId id)
        {
            return (await _databaseContext.ClipboardData.FindAsync(x => x.Id == id)).FirstOrDefault();
        }

        public async Task<ClipboardEntryDto> GetOne(Expression<Func<ClipboardEntryDto, bool>> expression)
        {
            return (await _databaseContext.ClipboardData.FindAsync(expression)).FirstOrDefault();
        }

        public async Task<ClipboardEntryDto> Create(ClipboardEntryDto clipboardEntryDto)
        {
            await _databaseContext.ClipboardData.InsertOneAsync(clipboardEntryDto);
            return await GetById(clipboardEntryDto.Id);
        }

        public async Task<ClipboardEntryDto> UpdateAsync(ClipboardEntryDto entity)
        {
            await _databaseContext.ClipboardData.ReplaceOneAsync(x => x.Id == entity.Id, entity,
                new UpdateOptions {IsUpsert = false});
            return entity;
        }

        public async Task<bool> Delete(ObjectId id)
        {            
            var result = await _databaseContext.ClipboardData.DeleteOneAsync(m => m.Id == id);
            return result.IsAcknowledged;
        }
    }}