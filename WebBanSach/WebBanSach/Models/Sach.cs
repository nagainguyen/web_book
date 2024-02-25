namespace WebBanSach.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sach")]
    public partial class Sach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sach()
        {
            GioHang = new HashSet<GioHang>();
        }

        [Key]
        [StringLength(10)]
        public string MaSach { get; set; }

        [StringLength(200)]
        public string TenSach { get; set; }

        [StringLength(20)]
        public string MaTheLoai { get; set; }

        [StringLength(100)]
        public string TacGia { get; set; }

        [StringLength(100)]
        public string NhaXuatBan { get; set; }

        public int? Gia { get; set; }

        [StringLength(100)]
        public string BiaSach { get; set; }

        [StringLength(7)]
        public string MaTrangThai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GioHang> GioHang { get; set; }

        public virtual TheLoai TheLoai { get; set; }

        public virtual TrangThai TrangThai { get; set; }
    }
}
