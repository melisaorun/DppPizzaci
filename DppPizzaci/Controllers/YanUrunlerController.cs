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
    public class YanUrunlerController : Controller
    {
        // GET: YanUrunler
        public ActionResult Index()
        {
            return View(DPP.ReturnList<YanUrunlerModel>("RListele1"));
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
                param.Add("@UrunNo", id);
                return View(DPP.ReturnList<YanUrunlerModel>("RSiralama1", param).FirstOrDefault<YanUrunlerModel>());
            }
        }
        [HttpPost]

        public ActionResult EY(YanUrunlerModel yanUrunler)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@UrunNo", yanUrunler.UrunNo);
            param.Add("@UrunTuru", yanUrunler.UrunTuru);
            param.Add("@UrunAdi", yanUrunler.UrunAdi);
            param.Add("@Icindekiler", yanUrunler.Icindekiler);
            param.Add("@Fiyat", yanUrunler.Fiyat);
            DPP.ExReturn("RCRUP1", param);
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id = 0)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@UrunNo", id);
            DPP.ExReturn("RSil1", param);
            return RedirectToAction("Index");
        }

    }
}
