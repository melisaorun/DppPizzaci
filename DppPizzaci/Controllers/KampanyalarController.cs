using Dapper;
using DppPizzaci.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using DppPizzaci.Models;

namespace DppPizzaci.Controllers
{
    public class KampanyalarController : Controller
    {
        // GET: Kampanyalar
        public ActionResult Index()
        {
            return View(DPP.ReturnList<KampanyalarModel>("RListele2"));
        }
        public ActionResult EY(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@KampanyaNo", id);
                return View(DPP.ReturnList<KampanyalarModel>("RSiralama2", param).FirstOrDefault<KampanyalarModel>());
            }
        }
        [HttpPost]

        public ActionResult EY(KampanyalarModel kampanyalar)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@KampanyaNo", kampanyalar.KampanyaNo);
            param.Add("@KampanyaAdi", kampanyalar.KampanyaAdi);
            param.Add("@Icindekiler", kampanyalar.Icindekiler);
            param.Add("@Fiyat", kampanyalar.Fiyat);
            DPP.ExReturn("RCRUP2", param);
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id = 0)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@KampanyaNo", id);
            DPP.ExReturn("RSil2", param);
            return RedirectToAction("Index");
        }

    }
}
