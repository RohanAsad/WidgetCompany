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
    public class WidgetController : Controller
    {
        WidgetsCompanyEntities db = new WidgetsCompanyEntities();
        WidgetBL widgetBL = new WidgetBL();

        // GET: Widget
        public ActionResult Index()
        {
            return View(widgetBL.GetAll());
        }

        // GET: Widget/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Widget/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Widget/Create
        [HttpPost]
        public ActionResult Create(WidgetBO obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    
                    string message = widgetBL.Add(obj);
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

        // GET: Widget/Edit/5
        public ActionResult Edit(int id)
        {
            return View(widgetBL.GetById(id));
        }

        // POST: Widget/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, WidgetBO obj)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    string message = widgetBL.Edit(id, obj);
                    ModelState.Clear();

                    TempData["Message"] = message;
                }

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                TempData["Message"] = ex.Message;

                return View();
            }
        }

        // GET: Widget/Delete/5
        /*public ActionResult Delete(int id)
        {
            return View(widgetBL.GetById(id));
        }

        // POST: Widget/Delete/5
        [HttpPost]*/
        public ActionResult Delete(int id)
        {
            try
            {
                string message = widgetBL.Delete(id);

                TempData["Message"] = message;

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                TempData["Message"] = ex.Message;

                return View();
            }
        }
    }
}
