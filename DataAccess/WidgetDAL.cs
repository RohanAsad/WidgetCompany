using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class WidgetDAL
    {
        WidgetsCompanyEntities db;
        public WidgetDAL()
        {
            db = new WidgetsCompanyEntities();
        }

        public string Add(WidgetBO item)
        {
            Widget obj = new Widget()
            {
                Pack = item.Pack,
                CreatedAt = DateTime.Now,
            };

            db.Widgets.Add(obj);

            string returnmessage = "Insertion Successful";
            try
            {
                int returnvalue = db.SaveChanges();
                if (returnvalue <= 0)
                    returnmessage = "Insertion Failed";

            }
            catch (Exception ex)
            {
                returnmessage = ex.Message;
            }

            return returnmessage;
        }


        public string Edit(int id, WidgetBO item)
        {
            var entity = db.Widgets.FirstOrDefault(x => x.Id == id);

            db.Entry(entity).State = System.Data.Entity.EntityState.Detached;

            Widget obj = new Widget()
            {
                Id = id,
                Pack = item.Pack,
                CreatedAt = item.CreatedAt,
                ModifiedAt = DateTime.Now,
            };

            string returnmessage = "Update Successful";
            try
            {
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                int returnvalue = db.SaveChanges();
                if (returnvalue <= 0)
                    returnmessage = "Update Failed";
            }
            catch (Exception ex)
            {
                returnmessage = ex.Message;
            }

            return returnmessage;

        }

        public IQueryable<Widget> GetAll()
        {
            return db.Widgets.AsQueryable();

        }

        public WidgetBO GetById(int id)
        {
            var widget = db.Widgets.FirstOrDefault(x => x.Id == id);

            WidgetBO widgetBO = new WidgetBO()
            {
                Pack = widget.Pack,
                CreatedAt = widget.CreatedAt,
                ModifiedAt = widget.ModifiedAt,
            };

            return widgetBO;
        }

        public string Delete(int id)
        {
            var entity = db.Widgets.FirstOrDefault(x => x.Id == id);

            db.Widgets.Remove(entity);

            string returnmessage = "Deletion Successful";
            try
            {
                int returnvalue = db.SaveChanges();
                if (returnvalue <= 0)
                    returnmessage = "Deletion Failed";
            }
            catch (Exception ex)
            {
                returnmessage = ex.Message;
            }

            return returnmessage;

        }
    }
}
