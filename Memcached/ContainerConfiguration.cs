using Enyim.Caching.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Memcached
{
    internal static class ContainerConfiguration
    {
        public static IServiceProvider Configure()
        {
            var service = new ServiceCollection();
            service.AddLogging();
            service.AddEnyimMemcached(x => x.Servers = new List<Server> { new Server { Address = "localhost", Port = 11211 } });

            service.AddSingleton<ICacheProvider, CacheProvider>();
            service.AddSingleton<ICacheRepository, CacheRepository>();

            return service.BuildServiceProvider();
        }
    }
}
