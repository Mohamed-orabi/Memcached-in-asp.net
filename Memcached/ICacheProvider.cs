using System;
using System.Collections.Generic;
using System.Text;

namespace Memcached
{
    internal interface ICacheProvider
    {
        T GetCache<T>(string key);
    }
}
