namespace WebBanSach.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GioHang")]
    public partial class GioHang
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string TenTK { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaSach { get; set; }

        public short? Soluong { get; set; }

        public long? TongTien { get; set; }

        public virtual Sach Sach { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
