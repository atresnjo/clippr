using Clippr.Domain;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using MongoDB.Bson;

namespace Clippr.Infrastructure.Interfaces
{
    public interface IClipboardEntityContext
    {
        Task<IEnumerable<ClipboardEntryDto>> GetMany(Expression<Func<ClipboardEntryDto, bool>> expression = null);
        Task<ClipboardEntryDto> GetById(ObjectId id);
        Task<ClipboardEntryDto> GetOne(Expression<Func<ClipboardEntryDto, bool>> expression);
        Task<ClipboardEntryDto> Create(ClipboardEntryDto clipboardEntryDto);
        Task<ClipboardEntryDto> UpdateAsync(ClipboardEntryDto entity);        
        Task<bool> Delete(ObjectId id);     
    }
}