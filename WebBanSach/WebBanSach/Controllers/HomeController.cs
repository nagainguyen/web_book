using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Filters;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        NhaSachContext context = new NhaSachContext();
        static TaiKhoan taiKhoan = null;

        public ActionResult Index()
        {
            List<Sach> sach = context.Sach.ToList();
            return View(sach);
        }

        public ActionResult AboutUs()
        {
            return View();
        }

        public ActionResult MyAccount_none()
        {
            if (taiKhoan == null)
            {
                return RedirectToAction("Index");
            }
            return View(taiKhoan);
        }

        public ActionResult MyAccount(string TaiKhoan)
        {
            taiKhoan = context.TaiKhoan.FirstOrDefault(p => p.TenTK.Contains(TaiKhoan));
            return View(taiKhoan);
        }

        public String GetTenTK()
        {
            string tam = "null";
            if (taiKhoan != null)
            {
                tam = taiKhoan.TenTK;
            }
            return tam;
        }
    }
}