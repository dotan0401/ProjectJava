/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Entity
@Table(name = "VaiTroTaiKhoan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VaiTroTaiKhoan.findAll", query = "SELECT v FROM VaiTroTaiKhoan v"),
    @NamedQuery(name = "VaiTroTaiKhoan.findByMaTaiKhoan", query = "SELECT v FROM VaiTroTaiKhoan v WHERE v.vaiTroTaiKhoanPK.maTaiKhoan = :maTaiKhoan"),
    @NamedQuery(name = "VaiTroTaiKhoan.findByMaVaiTro", query = "SELECT v FROM VaiTroTaiKhoan v WHERE v.vaiTroTaiKhoanPK.maVaiTro = :maVaiTro"),
    @NamedQuery(name = "VaiTroTaiKhoan.findByStatus", query = "SELECT v FROM VaiTroTaiKhoan v WHERE v.status = :status"),
    @NamedQuery(name = "VaiTroTaiKhoan.findByNgayTao", query = "SELECT v FROM VaiTroTaiKhoan v WHERE v.ngayTao = :ngayTao"),
    @NamedQuery(name = "VaiTroTaiKhoan.findByNgayCapNhat", query = "SELECT v FROM VaiTroTaiKhoan v WHERE v.ngayCapNhat = :ngayCapNhat")})
public class VaiTroTaiKhoan implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected VaiTroTaiKhoanPK vaiTroTaiKhoanPK;
    @Column(name = "Status")
    private Boolean status;
    @Column(name = "NgayTao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Column(name = "NgayCapNhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;
    @JoinColumn(name = "MaTaiKhoan", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private TaiKhoan taiKhoan;
    @JoinColumn(name = "MaVaiTro", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private VaiTro vaiTro;

    public VaiTroTaiKhoan() {
    }

    public VaiTroTaiKhoan(VaiTroTaiKhoanPK vaiTroTaiKhoanPK) {
        this.vaiTroTaiKhoanPK = vaiTroTaiKhoanPK;
    }

    public VaiTroTaiKhoan(int maTaiKhoan, int maVaiTro) {
        this.vaiTroTaiKhoanPK = new VaiTroTaiKhoanPK(maTaiKhoan, maVaiTro);
    }

    public VaiTroTaiKhoanPK getVaiTroTaiKhoanPK() {
        return vaiTroTaiKhoanPK;
    }

    public void setVaiTroTaiKhoanPK(VaiTroTaiKhoanPK vaiTroTaiKhoanPK) {
        this.vaiTroTaiKhoanPK = vaiTroTaiKhoanPK;
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

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public VaiTro getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(VaiTro vaiTro) {
        this.vaiTro = vaiTro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vaiTroTaiKhoanPK != null ? vaiTroTaiKhoanPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VaiTroTaiKhoan)) {
            return false;
        }
        VaiTroTaiKhoan other = (VaiTroTaiKhoan) object;
        if ((this.vaiTroTaiKhoanPK == null && other.vaiTroTaiKhoanPK != null) || (this.vaiTroTaiKhoanPK != null && !this.vaiTroTaiKhoanPK.equals(other.vaiTroTaiKhoanPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.VaiTroTaiKhoan[ vaiTroTaiKhoanPK=" + vaiTroTaiKhoanPK + " ]";
    }
    
}
