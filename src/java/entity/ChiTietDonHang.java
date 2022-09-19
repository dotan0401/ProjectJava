/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Entity
@Table(name = "ChiTietDonHang")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChiTietDonHang.findAll", query = "SELECT c FROM ChiTietDonHang c"),
    @NamedQuery(name = "ChiTietDonHang.findByDonGia", query = "SELECT c FROM ChiTietDonHang c WHERE c.donGia = :donGia"),
    @NamedQuery(name = "ChiTietDonHang.findBySoLuong", query = "SELECT c FROM ChiTietDonHang c WHERE c.soLuong = :soLuong"),
    @NamedQuery(name = "ChiTietDonHang.findByNgayDat", query = "SELECT c FROM ChiTietDonHang c WHERE c.ngayDat = :ngayDat"),
    @NamedQuery(name = "ChiTietDonHang.findByNgayGiao", query = "SELECT c FROM ChiTietDonHang c WHERE c.ngayGiao = :ngayGiao"),
    @NamedQuery(name = "ChiTietDonHang.findByNgayNhan", query = "SELECT c FROM ChiTietDonHang c WHERE c.ngayNhan = :ngayNhan"),
    @NamedQuery(name = "ChiTietDonHang.findByMaDonHang", query = "SELECT c FROM ChiTietDonHang c WHERE c.chiTietDonHangPK.maDonHang = :maDonHang"),
    @NamedQuery(name = "ChiTietDonHang.findByMaSanPham", query = "SELECT c FROM ChiTietDonHang c WHERE c.chiTietDonHangPK.maSanPham = :maSanPham"),
    @NamedQuery(name = "ChiTietDonHang.findByStatus", query = "SELECT c FROM ChiTietDonHang c WHERE c.status = :status"),
    @NamedQuery(name = "ChiTietDonHang.findByNgayTao", query = "SELECT c FROM ChiTietDonHang c WHERE c.ngayTao = :ngayTao"),
    @NamedQuery(name = "ChiTietDonHang.findByNgayCapNhat", query = "SELECT c FROM ChiTietDonHang c WHERE c.ngayCapNhat = :ngayCapNhat")})
public class ChiTietDonHang implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ChiTietDonHangPK chiTietDonHangPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DonGia")
    private double donGia;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SoLuong")
    private int soLuong;
    @Column(name = "NgayDat")
    @Temporal(TemporalType.DATE)
    private Date ngayDat;
    @Column(name = "NgayGiao")
    @Temporal(TemporalType.DATE)
    private Date ngayGiao;
    @Column(name = "NgayNhan")
    @Temporal(TemporalType.DATE)
    private Date ngayNhan;
    @Size(max = 100)
    @Column(name = "Status")
    private String status;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Column(name = "NgayCapNhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;
    @JoinColumn(name = "MaDonHang", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private DonHang donHang;
    @JoinColumn(name = "MaSanPham", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false ,fetch = FetchType.EAGER)
    private SanPham sanPham;

    public ChiTietDonHang() {
    }

    public ChiTietDonHang(ChiTietDonHangPK chiTietDonHangPK) {
        this.chiTietDonHangPK = chiTietDonHangPK;
    }

    public ChiTietDonHang(ChiTietDonHangPK chiTietDonHangPK, double donGia, int soLuong) {
        this.chiTietDonHangPK = chiTietDonHangPK;
        this.donGia = donGia;
        this.soLuong = soLuong;
    }

    public ChiTietDonHang(int maDonHang, int maSanPham) {
        this.chiTietDonHangPK = new ChiTietDonHangPK(maDonHang, maSanPham);
    }

    public ChiTietDonHangPK getChiTietDonHangPK() {
        return chiTietDonHangPK;
    }

    public void setChiTietDonHangPK(ChiTietDonHangPK chiTietDonHangPK) {
        this.chiTietDonHangPK = chiTietDonHangPK;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    public Date getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(Date ngayDat) {
        this.ngayDat = ngayDat;
    }

    public Date getNgayGiao() {
        return ngayGiao;
    }

    public void setNgayGiao(Date ngayGiao) {
        this.ngayGiao = ngayGiao;
    }

    public Date getNgayNhan() {
        return ngayNhan;
    }

    public void setNgayNhan(Date ngayNhan) {
        this.ngayNhan = ngayNhan;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Date getNgayCapNhat() {
        return ngayCapNhat;
    }

    public void setNgayCapNhat(Date ngayCapNhat) {
        this.ngayCapNhat = ngayCapNhat;
    }

    public DonHang getDonHang() {
        return donHang;
    }

    public void setDonHang(DonHang donHang) {
        this.donHang = donHang;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (chiTietDonHangPK != null ? chiTietDonHangPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChiTietDonHang)) {
            return false;
        }
        ChiTietDonHang other = (ChiTietDonHang) object;
        if ((this.chiTietDonHangPK == null && other.chiTietDonHangPK != null) || (this.chiTietDonHangPK != null && !this.chiTietDonHangPK.equals(other.chiTietDonHangPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ChiTietDonHang[ chiTietDonHangPK=" + chiTietDonHangPK + " ]";
    }
    
}
