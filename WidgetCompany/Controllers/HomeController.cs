using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogic;
using BusinessObject;
using DataAccess;

namespace WidgetCompany.Controllers
{
    public class HomeController : Controller
    {

        WidgetsCompanyEntities db = new WidgetsCompanyEntities();
        WidgetOrderedBL orderedBL = new WidgetOrderedBL();

        // GET: Widget/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Widget/Create
        [HttpPost]
        public ActionResult Create(OrderBO obj)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    string message = orderedBL.Add(obj);
                    ModelState.Clear();

                    TempData["Message"] = message;
                }

                return View();
            }
            catch (Exception ex)
            {
                TempData["Message"] = ex.Message;

                return View();
            }
        }

        public ActionResult Index()
        {

            return View(orderedBL.GetAllOrders());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}