using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using DppPizzaci.Models;

namespace DppPizzaci.Controllers
{
    public class PizzalarController : Controller
    {
        // GET: Pizzalar
        public ActionResult Index()
        {
            return View(DPP.ReturnList<PizzalarModel>("RListele"));
        }
        [HttpGet]
        public ActionResult EY(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@PizzaNo", id);
                return View(DPP.ReturnList<PizzalarModel>("RSiralama", param).FirstOrDefault<PizzalarModel>());
            }
        }
        [HttpPost]

        public ActionResult EY(PizzalarModel pizzalar)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@PizzaNo", pizzalar.PizzaNo);
            param.Add("@PizzaAdi", pizzalar.PizzaAdi);
            param.Add("@PizzaBoyu", pizzalar.PizzaBoyu);
            param.Add("@Icindekiler", pizzalar.Icindekiler);
            param.Add("@Fiyat", pizzalar.Fiyat);
            DPP.ExReturn("RCRUP", param);
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id = 0)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@PizzaNo", id);
            DPP.ExReturn("RSil", param);
            return RedirectToAction("Index");
        }

    }
}
