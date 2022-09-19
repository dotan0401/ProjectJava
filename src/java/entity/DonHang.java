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
 * @author bahop
 */
@Entity
@Table(name = "DonHang")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DonHang.findAll", query = "SELECT d FROM DonHang d"),
    @NamedQuery(name = "DonHang.findById", query = "SELECT d FROM DonHang d WHERE d.id = :id"),
    @NamedQuery(name = "DonHang.findByTenNguoiNhan", query = "SELECT d FROM DonHang d WHERE d.tenNguoiNhan = :tenNguoiNhan"),
    @NamedQuery(name = "DonHang.findByDiaChiNhan", query = "SELECT d FROM DonHang d WHERE d.diaChiNhan = :diaChiNhan"),
    @NamedQuery(name = "DonHang.findByStatus", query = "SELECT d FROM DonHang d WHERE d.status = :status"),
    @NamedQuery(name = "DonHang.findByNgayTao", query = "SELECT d FROM DonHang d WHERE d.ngayTao = :ngayTao"),
    @NamedQuery(name = "DonHang.findBySDTNguoiNhan", query = "SELECT d FROM DonHang d WHERE d.sDTNguoiNhan = :sDTNguoiNhan"),
    })
public class DonHang implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "TenNguoiNhan")
    private String tenNguoiNhan;
    @Size(max = 2147483647)
    @Column(name = "DiaChiNhan")
    private String diaChiNhan;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "GhiChu")
    private String ghiChu;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Size(max = 2147483647)
    @Column(name = "SDTNguoiNhan")
    private String sDTNguoiNhan;
    @Size(max = 100)
    @Column(name = "Status")
    private String status;
    @JoinColumn(name = "MaNguoiDung", referencedColumnName = "Id")
    @ManyToOne
    private NguoiDung maNguoiDung;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "donHang", fetch = FetchType.EAGER)
    private Collection<ChiTietDonHang> chiTietDonHangCollection;

    public DonHang() {
    }

    public DonHang(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTenNguoiNhan() {
        return tenNguoiNhan;
    }

    public void setTenNguoiNhan(String tenNguoiNhan) {
        this.tenNguoiNhan = tenNguoiNhan;
    }

    public String getDiaChiNhan() {
        return diaChiNhan;
    }

    public void setDiaChiNhan(String diaChiNhan) {
        this.diaChiNhan = diaChiNhan;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getSDTNguoiNhan() {
        return sDTNguoiNhan;
    }

    public void setSDTNguoiNhan(String sDTNguoiNhan) {
        this.sDTNguoiNhan = sDTNguoiNhan;
    }
    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }
     public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public NguoiDung getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(NguoiDung maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    @XmlTransient
    public Collection<ChiTietDonHang> getChiTietDonHangCollection() {
        return chiTietDonHangCollection;
    }

    public void setChiTietDonHangCollection(Collection<ChiTietDonHang> chiTietDonHangCollection) {
        this.chiTietDonHangCollection = chiTietDonHangCollection;
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
        if (!(object instanceof DonHang)) {
            return false;
        }
        DonHang other = (DonHang) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.DonHang[ id=" + id + " ]";
    }

}
