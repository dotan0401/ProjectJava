/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.frontend;

import dao.HibernateUtil;
import entity.ChiTietDonHang;
import entity.DonHang;
import entity.NguoiDung;
import entity.SanPham;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author bahop
 */
public class DonHangDAO {

    Session session;

    public List<DonHang> getAll() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from DonHang c");
        List<DonHang> re = q.list();
        session.close();
        return re;
    }

//    public void insert(String tenNguoiNhan, String diaChiNhan, String ghiChu, String sDTNguoiNhan ) {
//        session = HibernateUtil.getSessionFactory().openSession();
//        session.beginTransaction();
//        DonHang dh = new DonHang();
//        dh.setTenNguoiNhan(tenNguoiNhan);
//        dh.setDiaChiNhan(diaChiNhan);
//        dh.setGhiChu(ghiChu);
//        dh.setSDTNguoiNhan(sDTNguoiNhan);
//        dh.setNgayDat(new Date());
//        dh.setNgayGiao(null);
//        dh.setNgayNhan(null);
//        dh.setNgayTao(new Date());
//        dh.setNgayCapNhat(null);
//        dh.setStatus(null);
////        dh.setMaNguoiDung( maNguoiDung);
//        session.save(dh);
//        session.getTransaction().commit();
//        session.close();
//    }
    public void insert(DonHang c) {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
//        c.setMaNguoiDung( maNguoiDung);
        c.setStatus("1");
        c.setNgayTao(new Date());
        session.save(c);
        session.getTransaction().commit();
        session.close();
    }

    public void insertChiTiet(ChiTietDonHang c) {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        c.setNgayDat(new Date());
        c.setNgayGiao(null);
        c.setNgayNhan(null);
        c.setNgayTao(new Date());
        session.save(c);
        session.getTransaction().commit();
        session.close();
    }

    public int getLatestDonHang() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("select id from DonHang order by ngayTao desc");
        int id = (int) q.list().get(0);
        session.close();
        return id;
    }

}
