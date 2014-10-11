using FluentNHibernate.Automapping;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using NHibernate;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;
using seti.Entities;
using StructureMap;
using System;
using System.Windows.Forms;

namespace seti
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            IContainer container = new Container(c =>
            {
                 c.ForSingletonOf<ISessionFactory>().Use(CreateSessionFactory());
            });

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1(container));
        }

        static AutoPersistenceModel CreateAutomappings()
        {
            // This is the actual automapping - use AutoMap to start automapping,
            // then pick one of the static methods to specify what to map (in this case
            // all the classes in the assembly that contains Employee), and then either
            // use the Setup and Where methods to restrict that behaviour, or (preferably)
            // supply a configuration instance of your definition to control the automapper.
            return AutoMap.AssemblyOf<Project>(new AutomappingConfiguration())
                .Conventions.Add<CascadeConvention>();
        }

        private static ISessionFactory CreateSessionFactory()
        {
            return Fluently.Configure()
                .Database(MySQLConfiguration.Standard.ConnectionString(
                    c => c.FromConnectionStringWithKey("local-mysql")
                    ).AdoNetBatchSize(1000)
                )
                
                .Mappings(m =>
                    m.FluentMappings.AddFromAssemblyOf<Form1>())
                .ExposeConfiguration(BuildSchema)
                .BuildSessionFactory();
        }

        private static void BuildSchema(Configuration config)
        {
            // this NHibernate tool takes a configuration (with mapping info in)
            // and exports a database schema from it
            new SchemaExport(config)
                .Create(false, true);
        }
    }
}
