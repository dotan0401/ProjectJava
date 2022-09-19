/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.frontend;

import dao.HibernateUtil;
import entity.ChiTietDonHang;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author bahop
 */
public class ChiTietDonHangDAO {
    Session session;
    
      public List<ChiTietDonHang> getAll() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from ChiTietDonHang c");
        List<ChiTietDonHang> re = q.list();
        session.close();
        return re;
    }

    public void insert(ChiTietDonHang c) {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(c);
        session.getTransaction().commit();
        session.close();
    }
    
    
}
