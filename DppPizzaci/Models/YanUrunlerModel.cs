using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DppPizzaci.Models
{
    public class YanUrunlerModel
    {
        public int UrunNo { get; set; }
        public string UrunTuru { get; set; }
        public string UrunAdi { get; set; }
        public string Icindekiler { get; set; }
        public int Fiyat { get; set; }
    }
}