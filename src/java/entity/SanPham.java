/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Entity
@Table(name = "SanPham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SanPham.findAll", query = "SELECT s FROM SanPham s"),
    @NamedQuery(name = "SanPham.findById", query = "SELECT s FROM SanPham s WHERE s.id = :id"),
    @NamedQuery(name = "SanPham.findByTen", query = "SELECT s FROM SanPham s WHERE s.ten = :ten"),
    @NamedQuery(name = "SanPham.findByCpu", query = "SELECT s FROM SanPham s WHERE s.cpu = :cpu"),
    @NamedQuery(name = "SanPham.findByMain", query = "SELECT s FROM SanPham s WHERE s.main = :main"),
    @NamedQuery(name = "SanPham.findByAudio", query = "SELECT s FROM SanPham s WHERE s.audio = :audio"),
    @NamedQuery(name = "SanPham.findByBanPhim", query = "SELECT s FROM SanPham s WHERE s.banPhim = :banPhim"),
    @NamedQuery(name = "SanPham.findByTrongLuong", query = "SELECT s FROM SanPham s WHERE s.trongLuong = :trongLuong"),
    @NamedQuery(name = "SanPham.findByMauSac", query = "SELECT s FROM SanPham s WHERE s.mauSac = :mauSac"),
    @NamedQuery(name = "SanPham.findByKichThuoc", query = "SELECT s FROM SanPham s WHERE s.kichThuoc = :kichThuoc"),
    @NamedQuery(name = "SanPham.findByDonGia", query = "SELECT s FROM SanPham s WHERE s.donGia = :donGia"),
    @NamedQuery(name = "SanPham.findByDonViBan", query = "SELECT s FROM SanPham s WHERE s.donViBan = :donViBan"),
    @NamedQuery(name = "SanPham.findByDonViKho", query = "SELECT s FROM SanPham s WHERE s.donViKho = :donViKho"),
    @NamedQuery(name = "SanPham.findByHdd", query = "SELECT s FROM SanPham s WHERE s.hdd = :hdd"),
    @NamedQuery(name = "SanPham.findBySsd", query = "SELECT s FROM SanPham s WHERE s.ssd = :ssd"),
    @NamedQuery(name = "SanPham.findByVga", query = "SELECT s FROM SanPham s WHERE s.vga = :vga"),
    @NamedQuery(name = "SanPham.findByDungLuongPin", query = "SELECT s FROM SanPham s WHERE s.dungLuongPin = :dungLuongPin"),
    @NamedQuery(name = "SanPham.findByHeDieuHanh", query = "SELECT s FROM SanPham s WHERE s.heDieuHanh = :heDieuHanh"),
    @NamedQuery(name = "SanPham.findByManHinh", query = "SELECT s FROM SanPham s WHERE s.manHinh = :manHinh"),
    @NamedQuery(name = "SanPham.findByRam", query = "SELECT s FROM SanPham s WHERE s.ram = :ram"),
    @NamedQuery(name = "SanPham.findByThietKe", query = "SELECT s FROM SanPham s WHERE s.thietKe = :thietKe"),
    @NamedQuery(name = "SanPham.findByThongTinBaoHanh", query = "SELECT s FROM SanPham s WHERE s.thongTinBaoHanh = :thongTinBaoHanh"),
    @NamedQuery(name = "SanPham.findByThongTinChung", query = "SELECT s FROM SanPham s WHERE s.thongTinChung = :thongTinChung"),
    @NamedQuery(name = "SanPham.findByStatus", query = "SELECT s FROM SanPham s WHERE s.status = :status"),
    @NamedQuery(name = "SanPham.findByNgayTao", query = "SELECT s FROM SanPham s WHERE s.ngayTao = :ngayTao"),
    @NamedQuery(name = "SanPham.findByNgayCapNhat", query = "SELECT s FROM SanPham s WHERE s.ngayCapNhat = :ngayCapNhat")})
public class SanPham implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "Ten")
    private String ten;
    @Size(max = 2147483647)
    @Column(name = "Cpu")
    private String cpu;
    @Size(max = 2147483647)
    @Column(name = "Main")
    private String main;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "CongGiaoTiep")
    private String congGiaoTiep;
    @Size(max = 2147483647)
    @Column(name = "Audio")
    private String audio;
    @Size(max = 2147483647)
    @Column(name = "BanPhim")
    private String banPhim;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "TrongLuong")
    private Double trongLuong;
    @Size(max = 2147483647)
    @Column(name = "MauSac")
    private String mauSac;
    @Size(max = 2147483647)
    @Column(name = "KichThuoc")
    private String kichThuoc;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DonGia")
    private double donGia;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DonViBan")
    private long donViBan;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DonViKho")
    private long donViKho;
    @Size(max = 2147483647)
    @Column(name = "HDD")
    private String hdd;
    @Size(max = 2147483647)
    @Column(name = "SSD")
    private String ssd;
    @Size(max = 2147483647)
    @Column(name = "VGA")
    private String vga;
    @Size(max = 2147483647)
    @Column(name = "DungLuongPin")
    private String dungLuongPin;
    @Size(max = 2147483647)
    @Column(name = "HeDieuHanh")
    private String heDieuHanh;
    @Size(max = 2147483647)
    @Column(name = "ManHinh")
    private String manHinh;
    @Size(max = 2147483647)
    @Column(name = "Ram")
    private String ram;
    @Size(max = 2147483647)
    @Column(name = "ThietKe")
    private String thietKe;
    @Size(max = 2147483647)
    @Column(name = "ThongTinBaoHanh")
    private String thongTinBaoHanh;
    @Size(max = 2147483647)
    @Column(name = "ThongTinChung")
    private String thongTinChung;
    @Column(name = "Status")
    private Boolean status;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Column(name = "NgayCapNhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;
    @OneToMany(mappedBy = "maSanPham",fetch = FetchType.EAGER)
    private Collection<Anh> anhCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sanPham")
    private Collection<ChiTietDonHang> chiTietDonHangCollection;
    @JoinColumn(name = "MaHangSanXuat", referencedColumnName = "Id")
    @ManyToOne
    private HangSanXuat maHangSanXuat;

    public SanPham() {
    }

    public SanPham(Integer id) {
        this.id = id;
    }

    public SanPham(Integer id, double donGia, long donViBan, long donViKho) {
        this.id = id;
        this.donGia = donGia;
        this.donViBan = donViBan;
        this.donViKho = donViKho;
    }

    public SanPham(String ten) {
        this.ten = ten;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getMain() {
        return main;
    }

    public void setMain(String main) {
        this.main = main;
    }

    public String getCongGiaoTiep() {
        return congGiaoTiep;
    }

    public void setCongGiaoTiep(String congGiaoTiep) {
        this.congGiaoTiep = congGiaoTiep;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getBanPhim() {
        return banPhim;
    }

    public void setBanPhim(String banPhim) {
        this.banPhim = banPhim;
    }

    public Double getTrongLuong() {
        return trongLuong;
    }

    public void setTrongLuong(Double trongLuong) {
        this.trongLuong = trongLuong;
    }

    public String getMauSac() {
        return mauSac;
    }

    public void setMauSac(String mauSac) {
        this.mauSac = mauSac;
    }

    public String getKichThuoc() {
        return kichThuoc;
    }

    public void setKichThuoc(String kichThuoc) {
        this.kichThuoc = kichThuoc;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

    public long getDonViBan() {
        return donViBan;
    }

    public void setDonViBan(long donViBan) {
        this.donViBan = donViBan;
    }

    public long getDonViKho() {
        return donViKho;
    }

    public void setDonViKho(long donViKho) {
        this.donViKho = donViKho;
    }

    public String getHdd() {
        return hdd;
    }

    public void setHdd(String hdd) {
        this.hdd = hdd;
    }

    public String getSsd() {
        return ssd;
    }

    public void setSsd(String ssd) {
        this.ssd = ssd;
    }

    public String getVga() {
        return vga;
    }

    public void setVga(String vga) {
        this.vga = vga;
    }

    public String getDungLuongPin() {
        return dungLuongPin;
    }

    public void setDungLuongPin(String dungLuongPin) {
        this.dungLuongPin = dungLuongPin;
    }

    public String getHeDieuHanh() {
        return heDieuHanh;
    }

    public void setHeDieuHanh(String heDieuHanh) {
        this.heDieuHanh = heDieuHanh;
    }

    public String getManHinh() {
        return manHinh;
    }

    public void setManHinh(String manHinh) {
        this.manHinh = manHinh;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getThietKe() {
        return thietKe;
    }

    public void setThietKe(String thietKe) {
        this.thietKe = thietKe;
    }

    public String getThongTinBaoHanh() {
        return thongTinBaoHanh;
    }

    public void setThongTinBaoHanh(String thongTinBaoHanh) {
        this.thongTinBaoHanh = thongTinBaoHanh;
    }

    public String getThongTinChung() {
        return thongTinChung;
    }

    public void setThongTinChung(String thongTinChung) {
        this.thongTinChung = thongTinChung;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
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

    @XmlTransient
    public Collection<Anh> getAnhCollection() {
        return anhCollection;
    }

    public void setAnhCollection(Collection<Anh> anhCollection) {
        this.anhCollection = anhCollection;
    }

    @XmlTransient
    public Collection<ChiTietDonHang> getChiTietDonHangCollection() {
        return chiTietDonHangCollection;
    }

    public void setChiTietDonHangCollection(Collection<ChiTietDonHang> chiTietDonHangCollection) {
        this.chiTietDonHangCollection = chiTietDonHangCollection;
    }

    public HangSanXuat getMaHangSanXuat() {
        return maHangSanXuat;
    }

    public void setMaHangSanXuat(HangSanXuat maHangSanXuat) {
        this.maHangSanXuat = maHangSanXuat;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SanPham)) {
            return false;
        }
        SanPham other = (SanPham) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.SanPham[ id=" + id + " ]";
    }
    
}
