/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.frontend;

import dao.HibernateUtil;
import entity.HangSanXuat;
import entity.SanPham;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author bahop
 */
public class SanPhamDAO {

    Session session;

    public SanPhamDAO() {

    }

    public List<SanPham> getAll() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham c");
        List<SanPham> re = q.list();
        session.close();
        return re;
    }

    public List<SanPham> tangDan() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham c ORDER BY c.donGia ");
        List<SanPham> re = q.list();
        session.close();
        return re;
    }

    public List<SanPham> giamDan() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham c ORDER BY c.donGia DESC");
        List<SanPham> re = q.list();
        session.close();
        return re;
    }

//    public List<SanPham> pcGiaRe(float DonGia) {
//        session = HibernateUtil.getSessionFactory().openSession();
//        Query q = session.createQuery("from SanPham DonGia >= :dongia");
//        q.setParameter("dongia", 10000000);
//        List<SanPham> re = q.list();
//        session.close();
//        return re;
//    }
    public List<SanPham> searchId(int id) {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham where MaHangSanXuat = :ma ");
        q.setParameter("ma", id);
        List<SanPham> re = q.list();
        session.close();
        return re;
    }

    public SanPham getById(int id) {
        session = HibernateUtil.getSessionFactory().openSession();
        SanPham sp = (SanPham) session.get(SanPham.class, id);
        session.close();
        return sp;
    }

    public List<SanPham> getByIdChiTiet(int id) {
        SanPham sp = getById(id);
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham where MaHangSanXuat = :h and not id  =:id");
        q.setParameter("id", id);
        q.setParameter("h", sp.getMaHangSanXuat());
        List<SanPham> re = q.list();
        session.close();
        return re;
    }

    public List<SanPham> searchByPrice(float min, float max) {
        session = HibernateUtil.getSessionFactory().openSession();
        List<SanPham> pro = null;
        try {
            session.beginTransaction();
            Query q = session.createQuery("from SanPham where DonGia BETWEEN :min AND :max");
            q.setParameter("min", min);
            q.setParameter("max", max);
            pro = q.list();
            session.getTransaction().commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return pro;
    }

    public List<SanPham> searchByName(String ten) {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham p where p.ten like :ten");
        q.setParameter("ten", "%" + ten + "%");
        List<SanPham> re = q.list();
        session.close();
        return re;
    }

    public List<SanPham> getListByPage(List<SanPham> list, int start, int end) {
        ArrayList<SanPham> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    //dem số sp trong db
    public int getTotalSp(int id) {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("Select count (*) from SanPham =:id");
        q.setParameter("id", id);
//        List<SanPham> re = q.list();
        session.close();
        return 0;

    }

    public List<SanPham> phanTrang(int pageIndex, int pageSize) {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham c");
        ArrayList<SanPham> result = null;
        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((pageIndex - 1) * max);
        result = (ArrayList<SanPham>) q.list();
        session.close();
        return result;
    }

//    public List<GioHang> getCartSP(ArrayList<GioHang> cartList , int id) {
//        session = HibernateUtil.getSessionFactory().openSession();
//        List<GioHang> sp = new ArrayList<GioHang>();
//        try {
//            if (cartList.size() > 0) {
//                for (GioHang item : cartList) {
//                    Query q = session.createQuery("from SanPham where id=?");
//                    q.setParameter(1, id);
//                    List<SanPham> re = q.list();
//                    session.close();
//                }
//            }
//        } catch (Exception e) {
//        }
//
//    }
}
