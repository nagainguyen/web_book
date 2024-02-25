using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Filters;
using WebBanSach.Models;
using PagedList;


namespace WebBanSach.Controllers
{
    public class DanhSachSanPhamController : Controller
    {
        // GET: DanhSachSanPham
        NhaSachContext context = new NhaSachContext();
        static string maTheLoai;
        static string tenSach;
        public ActionResult Index(int? page)
        {
            //List<Sach> Sachs = context.Sach.ToList();
            //return View(Sachs);

            // 1. Tham số int? dùng để thể hiện null và kiểu int
            // page có thể có giá trị là null và kiểu int.

            // 2. Nếu page = null thì đặt lại là 1.
            if (page == null) page = 1;

            // 3. Tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
            // theo LinkID mới có thể phân trang.
            var links = (from l in context.Sach
                         select l).OrderBy(x => x.MaSach);

            // 4. Tạo kích thước trang (pageSize) hay là số Link hiển thị trên 1 trang
            int pageSize = 9;

            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);

            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            return View(links.ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult GetTheLoai(string MaTheLoai)
        {
            maTheLoai = MaTheLoai;
            return RedirectToAction("XuatTheoTheLoai");
        }

        [HttpPost]
        public ActionResult GetTen(string TenSach)
        {
            tenSach = TenSach;
            return RedirectToAction("XuatTheoTen");
        }

        public ActionResult XuatTheoTheLoai(int? page)
        {
            //List<Sach> Sachs = context.Sach.Where(p => p.MaTheLoai == MaTheLoai).ToList();
            //return View(Sachs);

            if (page == null) page = 1;
            var links = (from l in context.Sach where l.MaTheLoai == maTheLoai
                         select l).OrderBy(x => x.MaSach);
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            return View(links.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult XuatTheoTen(int? page)
        {
            //List<Sach> Sachs = context.Sach.Where(p => p.TenSach.ToLower().Contains(TenSach.ToLower())).ToList();
            //return View(Sachs);

            if (page == null) page = 1;
            var links = (from l in context.Sach where l.TenSach.ToLower().Contains(tenSach.ToLower())
                         select l).OrderBy(x => x.MaSach);
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            return View(links.ToPagedList(pageNumber, pageSize));
        }


        public ActionResult ChiTietSach(string MaSach)
        {
            Sach tam = context.Sach.FirstOrDefault(p => p.MaSach.TrimEnd() == MaSach);
            return View(tam);
        }
    }
}