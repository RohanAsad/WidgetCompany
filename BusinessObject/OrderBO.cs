using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class OrderBO
    {
        public int Id { get; set; }
        public Nullable<int> QuantityOrdered { get; set; }
        public Nullable<System.DateTime> OrderedDate { get; set; }

    }
}
