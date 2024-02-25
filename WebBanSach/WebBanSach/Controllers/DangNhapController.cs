using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class DangNhapController : Controller
    {
        // GET: DangNhap
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string TaiKhoan, string MatKhau)
        {
            NhaSachContext context = new NhaSachContext();
            var tam = context.TaiKhoan.FirstOrDefault(p => p.TenTK == TaiKhoan && p.MatKhau == MatKhau);
            if(tam == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                Session["UserID"] = Guid.NewGuid();
                return RedirectToAction("MyAccount", "Home", new { TaiKhoan = TaiKhoan });
            }
        }

        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(string TaiKhoan, string MatKhau, string TenTaiKhoan, string SDT, string Email, string DiaChi, string SoThe)
        {
            NhaSachContext context = new NhaSachContext();
            TaiKhoan tam = new TaiKhoan()
            {
                TenTK = TaiKhoan,
                MatKhau = MatKhau,
                TenKhach = TenTaiKhoan,
                SDT = SDT,
                Email = Email,
                DiaChi = DiaChi,
                SoThe = SoThe
            };
            context.TaiKhoan.Add(tam);
            context.SaveChanges();
            return RedirectToAction("MyAccount", "Home", new { TaiKhoan = TaiKhoan});
        }

    }
}