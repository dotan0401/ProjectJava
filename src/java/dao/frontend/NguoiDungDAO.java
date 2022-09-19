
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.frontend;

import dao.HibernateUtil;
import entity.DonHang;
import entity.HangSanXuat;
import entity.NguoiDung;
import entity.SanPham;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author bahop
 */
public class NguoiDungDAO {

    Session session;

    public NguoiDungDAO() {

    }

    public List<NguoiDung> getAll() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from NguoiDung");
        List<NguoiDung> re = q.list();
        session.close();
        return re;
    }

    public NguoiDung getByIdND(int id) {
        session = HibernateUtil.getSessionFactory().openSession();
        NguoiDung sp = (NguoiDung) session.get(NguoiDung.class, id);
        session.close();
        return sp;
    }

    public NguoiDung getNgByEmail(String email) {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from NguoiDung where Email = :email");
        q.setParameter("email", email);
        NguoiDung re = (NguoiDung) q.list().get(0);
        session.close();
        return re;
    }

    public List<NguoiDung> checkLogin(String email, String password) {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from NguoiDung where Email = :email and Password = :password");
        q.setParameter("email", email);
        q.setParameter("password", password);
        List<NguoiDung> re = q.list();
        session.close();
        return re;
    }

    //kiem tra tk đa tồn tại chưa
//    public boolean kiemTraTK(String email) {
//        session = HibernateUtil.getSessionFactory().openSession();
//        boolean checknd = false;
//        Query q = session.createQuery("from NguoiDung nd where nd.email=?  ");
//        q.setParameter(0, email);
//        List<NguoiDung> re = q.list();
//        if ((re != null) && (re.size() > 0)) {
//            checknd = true;
//        }
//        session.close();
//        return checknd;
//    }
    public void insert(String hoten, String diachi, String email, String pass, String sdt) {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        NguoiDung nd = new NguoiDung();
        nd.setHoTen(hoten);
        nd.setDiaChi(diachi);
        nd.setEmail(email);
        nd.setPassword(pass);
        nd.setSdt(sdt);
        nd.setStatus(Boolean.TRUE);
        nd.setNgayTao(new Date());
        nd.setNgayCapNhat(new Date());
        session.save(nd);
        session.getTransaction().commit();
        session.close();
    }

//    public void insert1(NguoiDung c) {
//        session = HibernateUtil.getSessionFactory().openSession();
//        session.beginTransaction();
//        session.save(c);
//        session.getTransaction().commit();
//        session.close();
//    }
    //kiem tra tk đa tồn tại chưa
    public boolean checkEmail(String email, String sdt) {
        session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "from NguoiDung nd where nd.email =:email or nd.sdt =:sdt";
        Query q = session.createQuery(sql);
        q.setParameter("email", email);
        q.setParameter("sdt", sdt);
        List<NguoiDung> list = q.list();
        if ((list != null) && (list.size() > 0)) {
            userFound = true;
        }
        session.close();
        return userFound;
    }

    public void update(NguoiDung c) {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        c.setNgayCapNhat(new Date());
        session.update(c);
        session.getTransaction().commit();
        session.close();
    }

}
