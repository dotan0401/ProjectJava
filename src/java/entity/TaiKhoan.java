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
@Table(name = "TaiKhoan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TaiKhoan.findAll", query = "SELECT t FROM TaiKhoan t"),
    @NamedQuery(name = "TaiKhoan.findById", query = "SELECT t FROM TaiKhoan t WHERE t.id = :id"),
    @NamedQuery(name = "TaiKhoan.findByHoTen", query = "SELECT t FROM TaiKhoan t WHERE t.hoTen = :hoTen"),
    @NamedQuery(name = "TaiKhoan.findByDiaChi", query = "SELECT t FROM TaiKhoan t WHERE t.diaChi = :diaChi"),
    @NamedQuery(name = "TaiKhoan.findByEmail", query = "SELECT t FROM TaiKhoan t WHERE t.email = :email"),
    @NamedQuery(name = "TaiKhoan.findByPassword", query = "SELECT t FROM TaiKhoan t WHERE t.password = :password"),
    @NamedQuery(name = "TaiKhoan.findBySdt", query = "SELECT t FROM TaiKhoan t WHERE t.sdt = :sdt"),
    @NamedQuery(name = "TaiKhoan.findByStatus", query = "SELECT t FROM TaiKhoan t WHERE t.status = :status"),
    @NamedQuery(name = "TaiKhoan.findByNgayTao", query = "SELECT t FROM TaiKhoan t WHERE t.ngayTao = :ngayTao"),
    @NamedQuery(name = "TaiKhoan.findByNgayCapNhat", query = "SELECT t FROM TaiKhoan t WHERE t.ngayCapNhat = :ngayCapNhat")})
public class TaiKhoan implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "HoTen")
    private String hoTen;
    @Size(max = 2147483647)
    @Column(name = "DiaChi")
    private String diaChi;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 2147483647)
    @Column(name = "Email")
    private String email;
    @Size(max = 200)
    @Column(name = "Password")
    private String password;
    @Size(max = 200)
    @Column(name = "Sdt")
    private String sdt;
    @Column(name = "Status")
    private Boolean status;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Column(name = "NgayCapNhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "taiKhoan" ,fetch = FetchType.EAGER)
    private Collection<VaiTroTaiKhoan> vaiTroTaiKhoanCollection;

    public TaiKhoan() {
    }

    public TaiKhoan(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
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
        if (!(object instanceof TaiKhoan)) {
            return false;
        }
        TaiKhoan other = (TaiKhoan) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.TaiKhoan[ id=" + id + " ]";
    }
    
}
