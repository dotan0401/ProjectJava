/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Embeddable
public class VaiTroTaiKhoanPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "MaTaiKhoan")
    private int maTaiKhoan;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MaVaiTro")
    private int maVaiTro;

    public VaiTroTaiKhoanPK() {
    }

    public VaiTroTaiKhoanPK(int maTaiKhoan, int maVaiTro) {
        this.maTaiKhoan = maTaiKhoan;
        this.maVaiTro = maVaiTro;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public int getMaVaiTro() {
        return maVaiTro;
    }

    public void setMaVaiTro(int maVaiTro) {
        this.maVaiTro = maVaiTro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) maTaiKhoan;
        hash += (int) maVaiTro;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VaiTroTaiKhoanPK)) {
            return false;
        }
        VaiTroTaiKhoanPK other = (VaiTroTaiKhoanPK) object;
        if (this.maTaiKhoan != other.maTaiKhoan) {
            return false;
        }
        if (this.maVaiTro != other.maVaiTro) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.VaiTroTaiKhoanPK[ maTaiKhoan=" + maTaiKhoan + ", maVaiTro=" + maVaiTro + " ]";
    }
    
}
