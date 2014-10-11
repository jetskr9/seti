using FluentNHibernate.Mapping;
using seti.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace seti.Mappings
{
    public class ProjectUpdateMap : ClassMap<ProjectUpdate>
    {
        public ProjectUpdateMap()
        {
            Id(x => x.Id);
            Map(x => x.Project_id);
            Map(x => x.LastBatchUpdate);
            Map(x => x.UpdateTime);
            Map(x => x.TotalUsers);
            Map(x => x.TotalTeams);
            Map(x => x.TotalHosts);
            Map(x => x.TotalCredits);

            Table("Project_updates_nh");
        }
    }
}
