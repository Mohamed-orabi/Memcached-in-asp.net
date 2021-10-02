using Enyim.Caching;
using System;
using System.Collections.Generic;
using System.Text;

namespace Memcached
{
    class CacheRepository : ICacheRepository
    {
        private readonly IMemcachedClient memcachedClient;

        public CacheRepository(IMemcachedClient memcachedClient)
        {
            this.memcachedClient = memcachedClient;
        }
        public void SetCache<T>(string key,T value)
        {
             memcachedClient.Set(key,value,60 * 60);
        }
    }
}
