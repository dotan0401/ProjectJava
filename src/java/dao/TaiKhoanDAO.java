/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.TaiKhoan;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class TaiKhoanDAO {
    Session session = null;
    
    public List<TaiKhoan> getAll(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from VaiTroTaiKhoan ");
        List<TaiKhoan> list = q.list();
        session.close();
        return list;
    }
    
    public void update(int id, String hoTen, String diaChi,String password,boolean status) {
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update TaiKhoan set hoTen= :hoTen ,diaChi= :diaChi, password = :password, status = :status ,ngayCapNhat= :ngayCapNhat where id= :id";

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
    
     public TaiKhoan getById(int id){
         session = HibernateUtil.getSessionFactory().openSession();
        return  (TaiKhoan) session.get(TaiKhoan.class, id);
    }
   public Long count (){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from TaiKhoan");
        
        return Long.parseLong(q.uniqueResult().toString());
   }
   public Long countSearch (String name){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from TaiKhoan tk where tk.hoTen like :name or tk.email like :name or tk.sdt like :name or tk.diaChi like :name");
        q.setString("name", "%"+name+"%");
        return Long.parseLong(q.uniqueResult().toString());
   }
    
    
    public List<TaiKhoan> search(String name,int page){
        session = HibernateUtil.getSessionFactory().openSession();
        int max=5;
        Query q = session.createQuery("from TaiKhoan tk where tk.hoTen like :name or tk.email like :name or tk.sdt like :name or tk.diaChi like :name");
        q.setString("name", "%"+name+"%");
         q.setMaxResults(max);
        q.setFirstResult((page-1)*max);
        List<TaiKhoan> list = q.list();
        session.close();
        return list;
    }
    public void insert(TaiKhoan nv){
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(nv);
        session.getTransaction().commit();
        session.close();
    }
    
    public void update(TaiKhoan taikhoan){
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(taikhoan);
        session.getTransaction().commit();
        session.close();
    }
   
}
