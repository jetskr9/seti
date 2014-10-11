using FluentNHibernate.Mapping;
using seti.Entities;

namespace seti.Mappings
{
    public class ProjectMap : ClassMap<Project>
    {
        public ProjectMap()
        {
            Id(x => x.Id);
            Map(x => x.LastUpdate);
            Map(x => x.Name);
            Map(x => x.Url);
            Map(x => x.StatsUrl);
            Map(x => x.IsActive).Default("1");
            Map(x => x.InactiveDate).Nullable();
            Map(x => x.CreateDate);

            HasMany(x => x.ProjectUpdates);

            Table("project_nh");
        }
    }
}
