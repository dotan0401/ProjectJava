/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.VaiTro;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class VaiTroDAO {
    Session session = null;
    
    public List<VaiTro> getAll(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from VaiTro ");
        List<VaiTro> list = q.list();
        return list;
    }
    public VaiTro getById(int id){
         return (VaiTro) session.get(VaiTro.class, id);
    }
  
}
