using AutoMapper;
using Clippr.Domain;

namespace Clippr.Application.Profiles
{
    public class ClipboardMapping : Profile
    {
        public ClipboardMapping()
        {
            CreateMap<ClipboardEntryDto, ClipboardEntryDto>();
        }
    }
}
