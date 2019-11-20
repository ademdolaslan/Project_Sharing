using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Project_Sharing.Startup))]
namespace Project_Sharing
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
