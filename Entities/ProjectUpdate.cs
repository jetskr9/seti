using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace seti.Entities
{
    public class ProjectUpdate
    {
        public virtual int Id { get;set; }
        public virtual int Project_id { get; set; }
        public virtual DateTime LastBatchUpdate { get; set; }
        public virtual DateTime UpdateTime { get; set; }
        public virtual UInt32 TotalUsers { get; set; }
        public virtual UInt32 TotalTeams { get; set; }
        public virtual UInt32 TotalHosts { get; set; }
        public virtual UInt32 TotalCredits { get; set; }
    }
}
