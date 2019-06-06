using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using Clippr.Domain;
using MediatR;

namespace Clippr.Application.Commands.GetClipboardEntryCommand
{
    public class GetClipboardEntryCommandRequest : IRequest<IEnumerable<ClipboardEntryDto>>
    {
        public Expression<Func<ClipboardEntryDto, bool>> QueryExpression{ get; set; }
    }
}