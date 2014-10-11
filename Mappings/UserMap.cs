using FluentNHibernate.Mapping;
using seti.Entities;

namespace seti.Mappings
{
    public class UserMap : ClassMap<User>
    {
        public UserMap()
        {
            Id(x => x.Id).GeneratedBy.Assigned().CustomSqlType("char(32)");
            Map(x => x.ProjectId);
            Map(x => x.Country);
            Map(x => x.Name).CustomSqlType("mediumtext");
            Map(x => x.CreateTime);
            Map(x => x.TotalCredit);
            Map(x => x.ExpAvgCredit);
            Map(x => x.ExpAvgTime);
            Map(x => x.Url);
            Map(x => x.Factors);
            Map(x => x.Active);
            Map(x => x.TeamId);
            Map(x => x.HasProfile);
            Table("user_nh");
        }
    }
}
