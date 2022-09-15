using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class WidgetBL
    {
        public string Add(WidgetBO item)
        {
            return new WidgetDAL().Add(item);
        }

        public string Edit(int id, WidgetBO item)
        {
            return new WidgetDAL().Edit(id, item);
        }

        public IQueryable<Widget> GetAll()
        {
            return new WidgetDAL().GetAll();
        }

        public WidgetBO GetById(int id)
        {
            return new WidgetDAL().GetById(id);
        }

        public string Delete(int id)
        {
            return new WidgetDAL().Delete(id);
        }
    }
}
