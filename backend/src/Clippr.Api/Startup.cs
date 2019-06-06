using System;
using System.Reflection;
using AutoMapper;
using Clippr.Api.Extensions;
using Clippr.Api.Services;
using Clippr.Application.Commands.CreateClipboardEntryCommand;
using Clippr.Infrastructure.Context;
using Clippr.Infrastructure.Interfaces;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Clippr.Api
{
    public class Startup
    {

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddGrpc();
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            services.AddMediatR(Assembly.GetAssembly(typeof(CreateClipboardEntryCommandRequest)));
            services.AddTransient<MongoContext>();
            services.AddTransient<IClipboardEntityContext, ClipboardEntityContext>();
            services.AddSingleton<IClipboardBroadcasterService, ClipboardBroadcasterService>();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.StartClipboardBroadcaster();
            app.UseRouting();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGrpcService<ClipboardService>();
            });
        }
    }
}