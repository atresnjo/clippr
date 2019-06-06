using Clippr.Infrastructure.Interfaces;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

namespace Clippr.Api.Extensions
{
    public static class ApplicationBuilderExtension
    {
        public static void StartClipboardBroadcaster(this IApplicationBuilder applicationBuilder)
        {
            using var scope = applicationBuilder.ApplicationServices.CreateScope();
            var provider = scope.ServiceProvider;

            var service = provider.GetService<IClipboardBroadcasterService>();
            service.Start();
        }
    }
}