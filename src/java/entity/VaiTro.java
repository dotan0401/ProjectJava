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
@Table(name = "VaiTro")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VaiTro.findAll", query = "SELECT v FROM VaiTro v"),
    @NamedQuery(name = "VaiTro.findById", query = "SELECT v FROM VaiTro v WHERE v.id = :id"),
    @NamedQuery(name = "VaiTro.findByTen", query = "SELECT v FROM VaiTro v WHERE v.ten = :ten"),
    @NamedQuery(name = "VaiTro.findByStatus", query = "SELECT v FROM VaiTro v WHERE v.status = :status"),
    @NamedQuery(name = "VaiTro.findByNgayTao", query = "SELECT v FROM VaiTro v WHERE v.ngayTao = :ngayTao"),
    @NamedQuery(name = "VaiTro.findByNgayCapNhat", query = "SELECT v FROM VaiTro v WHERE v.ngayCapNhat = :ngayCapNhat")})
public class VaiTro implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "Id")
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "vaiTro")
    private Collection<VaiTroTaiKhoan> vaiTroTaiKhoanCollection;

    public VaiTro() {
    }

    public VaiTro(Integer id) {
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
    public Collection<VaiTroTaiKhoan> getVaiTroTaiKhoanCollection() {
        return vaiTroTaiKhoanCollection;
    }

    public void setVaiTroTaiKhoanCollection(Collection<VaiTroTaiKhoan> vaiTroTaiKhoanCollection) {
        this.vaiTroTaiKhoanCollection = vaiTroTaiKhoanCollection;
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
        if (!(object instanceof VaiTro)) {
            return false;
        }
        VaiTro other = (VaiTro) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.VaiTro[ id=" + id + " ]";
    }
    
}
