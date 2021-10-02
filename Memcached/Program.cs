using System;

namespace Memcached
{
    class Program
    {
        static void Main(string[] args)
        {
            var container = ContainerConfiguration.Configure();

            Console.WriteLine("Set cache");
            
            var repository = (ICacheRepository)container.GetService(typeof(ICacheRepository));
            
            repository.SetCache("name", "Mohamed");

            Console.WriteLine("Get cache");

            var provider = (ICacheProvider)container.GetService(typeof(ICacheProvider));

            Console.WriteLine($"Value from cache {provider.GetCache<string>("name")}");
            Console.ReadLine();
        }
    }
}
