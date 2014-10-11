using System;
using System.Collections.Generic;

namespace seti.Entities
{
    public class Project
    {
        public virtual int Id { get; set; }
        public virtual DateTime LastUpdate { get;set; }
        public virtual string Name { get;set; }
        public virtual string Url { get;set; }
        public virtual string StatsUrl { get;set; }
        public virtual bool IsActive { get;set; }
        public virtual DateTime InactiveDate { get;set; }
        public virtual DateTime CreateDate { get;set; }

        public virtual IList<ProjectUpdate> ProjectUpdates { get;set; }

    }
}
