/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.ChiTietDonHang;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class ThongKeDAO {
    Session session = null;
    public Integer countDonSuccess(){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from ChiTietDonHang where status=3");
        
        return Integer.parseInt(q.uniqueResult().toString());
   }
    public List<Double> DoanhThu(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select donGia from ChiTietDonHang where status=3");
        List<Double> list = q.list();
        return list;
    }
//    public List<ChiTietDonHang> DoanhThuTheoThang(){
//        session = HibernateUtil.getSessionFactory().openSession();
//        
//        Query q = session.createQuery("from ChiTietDonHang");
//        List<ChiTietDonHang> list = q.list();
//        return list;
//    }
    public List<Double> DoanhThuT1(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220101' and ngayNhan<= '20220131'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT2(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220201' and ngayNhan<= '20220228'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT3(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220301' and ngayNhan<= '20220331'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT4(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220401' and ngayNhan<= '20220430'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT5
        (){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220501' and ngayNhan<= '20220531'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT6(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220601' and ngayNhan<= '20220630'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT7(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220701' and ngayNhan<= '20220731'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT8(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220801' and ngayNhan<= '20220831'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT9(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20220901' and ngayNhan<= '20220930'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT10(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20221001' and ngayNhan<= '20221031'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT11(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20221101' and ngayNhan<= '20221130'");
        List<Double> list = q.list();
        return list;
    }
   public List<Double> DoanhThuT12(){
        session = HibernateUtil.getSessionFactory().openSession();
        
        SQLQuery q = session.createSQLQuery("select donGia from ChiTietDonHang where status=3 and ngayNhan >= '20221201' and ngayNhan<= '20221231'");
        List<Double> list = q.list();
        return list;
    }
   
   
    public Integer countDonHuy(){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from ChiTietDonHang");
        
        return Integer.parseInt(q.uniqueResult().toString());
   }
    public Integer countDonHuy1(){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from ChiTietDonHang where status=4");
        
        return Integer.parseInt(q.uniqueResult().toString());
   }
}
