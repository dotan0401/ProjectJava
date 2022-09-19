/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.NguoiDung;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class TaiKhoanUserDAO {
    Session session = null;
    
    public List<NguoiDung> getAll(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from NguoiDung ");
        List<NguoiDung> list = q.list();
        session.close();
        return list;
    }
    public NguoiDung getById(int id){
         session = HibernateUtil.getSessionFactory().openSession();
        return  (NguoiDung) session.get(NguoiDung.class, id);
    }
    public void insert(NguoiDung user){
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        session.close();
    }
    public void update(int id, String hoTen, String diaChi,String password,boolean status) {
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update NguoiDung set hoTen= :hoTen ,diaChi= :diaChi, password = :password, status = :status ,ngayCapNhat= :ngayCapNhat where id= :id";

        Query q = session.createQuery(sql);
        q.setParameter("hoTen", hoTen);
        q.setParameter("diaChi", diaChi);
        q.setParameter("password", password);
        q.setParameter("status", status);
        q.setParameter("ngayCapNhat", new Date());
        q.setParameter("id", id);
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
    }
     public void updateStatus(boolean status,int id) {
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update NguoiDung set status = :status ,ngayCapNhat= :ngayCapNhat where id= :id";
        Query q = session.createQuery(sql);
        q.setParameter("status", status);
        q.setParameter("ngayCapNhat", new Date());
        q.setParameter("id", id);
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
    }
    public boolean checkEmail(String email) {
        session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "from NguoiDung tk where tk.email=?";
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
        String sql = "from NguoiDung tk where tk.sdt=?";
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
