/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.HangSanXuat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class HangSanXuatDAO {
    Session session;
    public List<HangSanXuat> getAll(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from HangSanXuat");
        List<HangSanXuat> list = q.list();
        return list;
    }
    public HangSanXuat findByName(String name){
        session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("from HangSanXuat where ten =:name");
        query.setParameter("name", name);
        HangSanXuat hsx = (HangSanXuat) query.uniqueResult();
        session.close();
        return hsx;
    }
    public List<HangSanXuat> fildAllByStatus(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from HangSanXuat where status = 1");
        List<HangSanXuat> list = q.list();
        return list;
    }
    public void insert(HangSanXuat hsx){
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(hsx);
        session.getTransaction().commit();
        session.close();
    }
    public void update(String ten,boolean status,int id){
         session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update HangSanXuat set ten= :ten ,status= :status ,ngayCapNhat= :ngayCapNhat where id= :id";

        Query q = session.createQuery(sql);
        q.setParameter("ten", ten);
        q.setParameter("status", status);
        q.setParameter("id", id);
        q.setParameter("ngayCapNhat", new Date());
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    public HangSanXuat getById(int id){
        return  (HangSanXuat) session.get(HangSanXuat.class, id);
    }
    
    public boolean checkName(String name) {
        session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "from HangSanXuat hsx where hsx.ten=?";
        Query q = session.createQuery(sql);
        q.setParameter(0, name);
        List list = q.list();
        if ((list != null) && (list.size() > 0)) {
            userFound = true;
        }
        session.close();
        return userFound;
    }
}
