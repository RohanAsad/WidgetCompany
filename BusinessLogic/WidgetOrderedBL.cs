using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class WidgetOrderedBL
    {
        public string Add(OrderBO item)
        {
            return new WidgetOrderedDAL().Add(item);
        }

        public IQueryable<DataAccess.WidgetOrdered> GetAll()
        {
            return new WidgetOrderedDAL().GetAll();
        }

        public IQueryable<Order> GetAllOrders()
        {
            return new WidgetOrderedDAL().GetAllOrders();
        }
    }
}
