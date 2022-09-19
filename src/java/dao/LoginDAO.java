/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.TaiKhoan;
import entity.VaiTroTaiKhoan;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class LoginDAO {

    Session session = null;

    public void update(int id, String hoTen, String diaChi) {
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update TaiKhoan set hoTen= :hoTen ,diaChi= :diaChi ,ngayCapNhat= :ngayCapNhat where id= :id";

        Query q = session.createQuery(sql);
        q.setParameter("hoTen", hoTen);
        q.setParameter("diaChi", diaChi);
        q.setParameter("id", id);
        q.setParameter("ngayCapNhat", new Date());
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
    }

    public boolean checkLogin(String email, String password) {
        session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "select * from VaiTroTaiKhoan vttk inner join TaiKhoan tk on vttk.MaTaiKhoan = tk.Id where  email=? and password =?";
        SQLQuery q = session.createSQLQuery(sql);
        q.addEntity(VaiTroTaiKhoan.class);
        q.addEntity(TaiKhoan.class);
        q.setParameter(0, email);
        q.setParameter(1, password);
        List list = q.list();
        if ((list != null) && (list.size() > 0)) {
            userFound = true;
        }
        session.close();
        return userFound;
    }

    public TaiKhoan getByEmail(String email) {
        session = HibernateUtil.getSessionFactory().openSession();

        Query query = session.createQuery("from TaiKhoan where email=:email");
        query.setParameter("email", email);
        TaiKhoan taikhoan = (TaiKhoan) query.uniqueResult();
        session.close();
        return taikhoan;
    }

    public boolean checkEmail(String email) {
        session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "from TaiKhoan tk where tk.email=?";
        Query q = session.createQuery(sql);
        q.setParameter(0, email);
        List list = q.list();
        if ((list != null) && (list.size() > 0)) {
            userFound = true;
        }
        session.close();
        return userFound;
    }

    public boolean checkPhone(String sdt) {
        session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "from TaiKhoan tk where tk.sdt=?";
        Query q = session.createQuery(sql);
        q.setParameter(0, sdt);
        List list = q.list();
        if ((list != null) && (list.size() > 0)) {
            userFound = true;
        }
        session.close();
        return userFound;
    }
}
