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
public class ChiTietDonHangPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "MaDonHang")
    private int maDonHang;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MaSanPham")
    private int maSanPham;

    public ChiTietDonHangPK() {
    }

    public ChiTietDonHangPK(int maDonHang, int maSanPham) {
        this.maDonHang = maDonHang;
        this.maSanPham = maSanPham;
    }

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) maDonHang;
        hash += (int) maSanPham;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChiTietDonHangPK)) {
            return false;
        }
        ChiTietDonHangPK other = (ChiTietDonHangPK) object;
        if (this.maDonHang != other.maDonHang) {
            return false;
        }
        if (this.maSanPham != other.maSanPham) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ChiTietDonHangPK[ maDonHang=" + maDonHang + ", maSanPham=" + maSanPham + " ]";
    }
    
}
