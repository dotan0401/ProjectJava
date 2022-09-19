/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.frontend;

import dao.HibernateUtil;
import entity.HangSanXuat;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author bahop
 */
public class HangDAO {

    Session session;
    private Serializable id;

    public HangDAO() {

    }

    public List<HangSanXuat> getAll() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from HangSanXuat");
        List<HangSanXuat> re = q.list();
        session.close();
        return re;
    }
    
       public HangSanXuat getById(int id) {
        session = HibernateUtil.getSessionFactory().openSession();
        HangSanXuat sp = (HangSanXuat) session.get(HangSanXuat.class, id);
        session.close();
        return sp;
    }
}
