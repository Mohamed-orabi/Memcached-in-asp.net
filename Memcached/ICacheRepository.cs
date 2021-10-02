using System;
using System.Collections.Generic;
using System.Text;

namespace Memcached
{
    internal interface ICacheRepository
    {
        void SetCache<T>(string key,T value);
    }
}
