using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BusinessObject
{
    public class WidgetBO
    {

        public int Id { get; set; }

        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public int Pack { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
        public Nullable<System.DateTime> ModifiedAt { get; set; }

    }
}
