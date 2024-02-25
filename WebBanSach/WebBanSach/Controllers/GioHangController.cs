using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Filters;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        [MyAuthenFilter]
        public ActionResult Index(string TenTK)
        {
            var tam = context.GioHang.Where(p => p.TenTK.Contains(TenTK)).ToList();
            return View(tam);
        }

        NhaSachContext context = new NhaSachContext();

        [HttpGet]
        [MyAuthenFilter]
        public ActionResult ThemVaoGio(string TaiKhoan, string MaSach)
        {
            foreach(var item in context.GioHang)
            {
                if(item.TenTK.Contains(TaiKhoan) && item.MaSach.TrimEnd() == MaSach)
                {
                    return View();
                }
            }
            GioHang tam = new GioHang();
            tam.MaSach = MaSach;
            tam.TenTK = TaiKhoan.TrimEnd();
            context.GioHang.Add(tam);
            context.SaveChanges();

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult XoaKhoiGio(string TaiKhoan, string MaSach)
        {
            GioHang tam = context.GioHang.FirstOrDefault(p => p.TenTK.Contains(TaiKhoan) && p.MaSach.TrimEnd() == MaSach);
            context.GioHang.Remove(tam);
            context.SaveChanges();

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult XoaKhoiGio_KhiTrongGio(string TaiKhoan, string MaSach)
        {
            GioHang tam = context.GioHang.FirstOrDefault(p => p.TenTK.Contains(TaiKhoan) && p.MaSach.TrimEnd() == MaSach);
            context.GioHang.Remove(tam);
            context.SaveChanges();

            return RedirectToAction("Index", new { TenTK = TaiKhoan });
        }
    }
}