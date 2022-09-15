using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{

    public class WidgetOrderedDAL
    {

        WidgetsCompanyEntities db;
        public WidgetOrderedDAL()
        {
            db = new WidgetsCompanyEntities();
        }

        public string Add(OrderBO item)
        {
            var packs = db.Widgets.Select(x => x.Pack).ToList();

            var data = CountPacks(packs, (int)item.QuantityOrdered);

            Order obj = new Order()
            {
                QuantityOrdered = item.QuantityOrdered,
                OrderedDate = DateTime.Now,
            };

            db.Orders.Add(obj);

            foreach (var d in data)
            {
                if(d.Value != 0)
                {
                    int widId = db.Widgets.FirstOrDefault(x => x.Pack == d.Key).Id;

                    WidgetOrdered widgetOrdered = new WidgetOrdered()
                    {
                        WidgetId = widId,
                        OrderId = obj.Id,
                        Quantity = d.Value,
                    };

                    db.WidgetOrdereds.Add(widgetOrdered);
                }
                

            }

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

        static Dictionary<int, int> CountPacks(List<int> packs, int order)
        {
            packs = packs.OrderByDescending(x => x).ToList();

            Dictionary<int, int> dict = new Dictionary<int, int>();
            for (int i = 0; i < packs.Count; i++)
            {
                dict.Add(packs[i], 0);
            }

            for (int i = 0; i < packs.Count; i++)
            {
                if (order >= packs[i])
                {
                    dict[packs[i]] = (int)(order / packs[i]);

                    order = order - dict[packs[i]] * packs[i];
                }
            }

            if (order > 0)
            {
                if (dict[packs[packs.Count - 1]] == 1)
                {
                    dict[packs[packs.Count - 1]] = 0;
                    dict[packs[packs.Count - 2]]++;
                }
                else
                {
                    dict[packs[packs.Count - 1]] += 1;
                }
            }

            return dict;
        }


        public IQueryable<WidgetOrdered> GetAll()
        {
            return db.WidgetOrdereds.AsQueryable();
        }

        public IQueryable<Order> GetAllOrders()
        {
            var order = db.Orders.AsQueryable();

            foreach(var item in order)
            {
                var ordered = db.WidgetOrdereds.Where(x => x.OrderId == item.Id).ToList();
                item.WidgetOrdereds = ordered;
            }

            return order;
        }
    }
}
