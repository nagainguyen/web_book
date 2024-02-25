using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace WebBanSach.Models
{
    public partial class NhaSachContext : DbContext
    {
        public NhaSachContext()
            : base("name=NhaSachContext")
        {
        }

        public virtual DbSet<GioHang> GioHang { get; set; }
        public virtual DbSet<Sach> Sach { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoan { get; set; }
        public virtual DbSet<TheLoai> TheLoai { get; set; }
        public virtual DbSet<TrangThai> TrangThai { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<GioHang>()
                .Property(e => e.TenTK)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<GioHang>()
                .Property(e => e.MaSach)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.MaSach)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.MaTheLoai)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.BiaSach)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.MaTrangThai)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .HasMany(e => e.GioHang)
                .WithRequired(e => e.Sach)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.TenTK)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.SoThe)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.GioHang)
                .WithRequired(e => e.TaiKhoan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TheLoai>()
                .Property(e => e.MaTheLoai)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TrangThai>()
                .Property(e => e.MaTrangThai)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
