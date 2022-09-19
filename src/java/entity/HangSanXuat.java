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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "HangSanXuat")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HangSanXuat.findAll", query = "SELECT h FROM HangSanXuat h"),
    @NamedQuery(name = "HangSanXuat.findById", query = "SELECT h FROM HangSanXuat h WHERE h.id = :id"),
    @NamedQuery(name = "HangSanXuat.findByTen", query = "SELECT h FROM HangSanXuat h WHERE h.ten = :ten"),
    @NamedQuery(name = "HangSanXuat.findByStatus", query = "SELECT h FROM HangSanXuat h WHERE h.status = :status"),
    @NamedQuery(name = "HangSanXuat.findByNgayTao", query = "SELECT h FROM HangSanXuat h WHERE h.ngayTao = :ngayTao"),
    @NamedQuery(name = "HangSanXuat.findByNgayCapNhat", query = "SELECT h FROM HangSanXuat h WHERE h.ngayCapNhat = :ngayCapNhat")})
public class HangSanXuat implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "Ten")
    private String ten;
    @Column(name = "Status")
    private Boolean status;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Column(name = "NgayCapNhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;
    @OneToMany(mappedBy = "maHangSanXuat")
    private Collection<SanPham> sanPhamCollection;

    public HangSanXuat() {
    }

    public HangSanXuat(Integer id) {
        this.id = id;
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
    public Collection<SanPham> getSanPhamCollection() {
        return sanPhamCollection;
    }

    public void setSanPhamCollection(Collection<SanPham> sanPhamCollection) {
        this.sanPhamCollection = sanPhamCollection;
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
        if (!(object instanceof HangSanXuat)) {
            return false;
        }
        HangSanXuat other = (HangSanXuat) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.HangSanXuat[ id=" + id + " ]";
    }
    
}
