namespace WebBanSach.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TaiKhoan()
        {
            GioHang = new HashSet<GioHang>();
        }

        [Key]
        [StringLength(20)]
        [DisplayName("Account Name")]
        public string TenTK { get; set; }

        [StringLength(20)]
        [DisplayName("Password")]
        public string MatKhau { get; set; }

        [StringLength(100)]
        [DisplayName("Customer Name")]
        public string TenKhach { get; set; }

        [StringLength(11)]
        [DisplayName("Phone Number")]
        public string SDT { get; set; }

        [StringLength(100)]
        [DisplayName("Email")]
        public string Email { get; set; }

        [StringLength(200)]
        [DisplayName("Address")]
        public string DiaChi { get; set; }

        [StringLength(20)]
        [DisplayName("Bank Number")]
        public string SoThe { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GioHang> GioHang { get; set; }
    }
}
