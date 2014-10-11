using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace seti.Entities
{
    public class User
    {
        public virtual string Id { get; set; }
        public virtual int ProjectId { get;set; }
        public virtual string Country { get;set; }
        public virtual string Name { get; set; }
        public virtual UInt32 CreateTime { get; set; }
        public virtual Decimal TotalCredit { get; set; }
        public virtual Decimal ExpAvgCredit { get; set; }
        public virtual Decimal ExpAvgTime { get; set; }
        public virtual string Url { get; set; }
        public virtual string Factors { get;set; }
        public virtual bool Active { get;set; }
        public virtual UInt32 TeamId { get;set; }
        public virtual bool HasProfile { get;set; }
    }
}
