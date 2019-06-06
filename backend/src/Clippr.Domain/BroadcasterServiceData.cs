using Clippr.Communication;
using Grpc.Core;

namespace Clippr.Domain
{
    public class BroadcasterServiceData
    {
        public ServerCallContext Context { get; set; }
        public IServerStreamWriter<ClipboardEntryMessage> ServerStreamWriter { get; set; }

        public BroadcasterServiceData(IServerStreamWriter<ClipboardEntryMessage> serverStreamWriter,
            ServerCallContext context)
        {
            ServerStreamWriter = serverStreamWriter;
            Context = context;
        }
    }
}