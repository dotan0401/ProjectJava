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
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "Anh")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Anh.findAll", query = "SELECT a FROM Anh a"),
    @NamedQuery(name = "Anh.findById", query = "SELECT a FROM Anh a WHERE a.id = :id"),
    @NamedQuery(name = "Anh.findByUrl", query = "SELECT a FROM Anh a WHERE a.url = :url"),
    @NamedQuery(name = "Anh.findByStatus", query = "SELECT a FROM Anh a WHERE a.status = :status"),
    @NamedQuery(name = "Anh.findByNgayTao", query = "SELECT a FROM Anh a WHERE a.ngayTao = :ngayTao"),
    @NamedQuery(name = "Anh.findByNgayCapNhat", query = "SELECT a FROM Anh a WHERE a.ngayCapNhat = :ngayCapNhat")})
public class Anh implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Size(max = 2000)
    @Column(name = "Url")
    private String url;
    @Column(name = "Status")
    private Boolean status;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Column(name = "NgayCapNhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;
    @JoinColumn(name = "MaSanPham", referencedColumnName = "Id")
    @ManyToOne
    private SanPham maSanPham;

    public Anh() {
    }

    public Anh(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public SanPham getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(SanPham maSanPham) {
        this.maSanPham = maSanPham;
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
        if (!(object instanceof Anh)) {
            return false;
        }
        Anh other = (Anh) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Anh[ id=" + id + " ]";
    }
    
}
