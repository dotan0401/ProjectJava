/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.ChiTietDonHang;
import entity.DonHang;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class DonHangDAO {
    Session session;
    public List<DonHang> getAll(int page){
        session = HibernateUtil.getSessionFactory().openSession();
        int max=5;
        Query q = session.createQuery("from ChiTietDonHang where status = 1 or status =2 ORDER BY ngayTao DESC");
        q.setMaxResults(max);
        q.setFirstResult((page-1)*max);
        List<DonHang> list = q.list();
        return list;
    }
    public List<DonHang> findAllDonHoanThanh(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from ChiTietDonHang where status = 3 ORDER BY ngayTao DESC"); 
        List<DonHang> list = q.list();
        return list;
    }
    public List<DonHang> findAllDonHuy(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from ChiTietDonHang where status = 4 ORDER BY ngayTao DESC");
        List<DonHang> list = q.list();
        return list;
    }
    public List<DonHang> findAllXacnhan(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from ChiTietDonHang where status = 1 ORDER BY ngayTao DESC");
        List<DonHang> list = q.list();
        return list;
    }
    public List<DonHang> findAllGiaoHang(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from ChiTietDonHang where status = 2 ORDER BY ngayTao DESC");
        List<DonHang> list = q.list();
        return list;
    }
//    public List<DonHang> donhang(){
//        session = HibernateUtil.getSessionFactory().openSession();
//        Query q = session.createQuery("FROM DonHang dh INNER JOIN Team t ON e. Id_team=t. Id_team");
//        List<DonHang> list = q.list();
//        return list;
//    }
    public void update(long donviban,long donvikho,int idSP){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update SanPham set donViBan= :donViBan , donViKho= :donViKho where id = :idSP";

        SQLQuery q = session.createSQLQuery(sql);
        q.setParameter("donViBan", donviban);
        q.setParameter("donViKho", donvikho);
        q.setParameter("idSP", idSP);
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    public DonHang getById(int id){
         session = HibernateUtil.getSessionFactory().openSession();
        return  (DonHang) session.get(DonHang.class, id);
    }
    public ChiTietDonHang getByIdSP (int idSp,int idDh){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "from ChiTietDonHang where maSanPham = :id and maDonHang = :idDh";
        Query q = session.createQuery(sql);
        q.setParameter("id", idSp);
        q.setParameter("idDh", idDh);
        ChiTietDonHang ct = (ChiTietDonHang) q.uniqueResult();
        session.close();
        return ct;
    }
    public void updateChiTietS3(int status ,int idSp,int idDh){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update ChiTietDonHang set ngayNhan= :ngayNhan, status= :status,ngayCapNhat= :ngayCapNhat where maSanPham = :idSp and maDonHang = :idDh";

        SQLQuery q = session.createSQLQuery(sql);
        q.setParameter("idSp", idSp);
        q.setParameter("idDh", idDh);
        q.setParameter("status", status);
        q.setParameter("ngayCapNhat", new Date());
        q.setParameter("ngayNhan", new Date());
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    public void updateChiTietS2(int status ,int idSp,int idDh){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update ChiTietDonHang set ngayGiao= :ngayGiao, status= :status,ngayCapNhat= :ngayCapNhat where maSanPham = :idSp and maDonHang = :idDh";

        SQLQuery q = session.createSQLQuery(sql);
        q.setParameter("idSp", idSp);
        q.setParameter("idDh", idDh);
        q.setParameter("status", status);
        q.setParameter("ngayCapNhat", new Date());
        q.setParameter("ngayGiao", new Date());
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    
    public void updateChiTiet(int status ,int idSp,int idDh){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update ChiTietDonHang set  status= :status,ngayCapNhat= :ngayCapNhat where maSanPham = :idSp and maDonHang = :idDh";

        SQLQuery q = session.createSQLQuery(sql);
        q.setParameter("idSp", idSp);
        q.setParameter("idDh", idDh);
        q.setParameter("status", status);
        q.setParameter("ngayCapNhat", new Date());
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    public void deleteCT(int idSp,int idDh){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "delete from ChiTietDonHang where maSanPham= :idSp and maDonHang= :idDh";
        SQLQuery q = session.createSQLQuery(sql);
        q.setParameter("idSp", idSp);
        q.setParameter("idDh", idDh);
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    public void deleteDh(int idDh){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "delete from DonHang where id= :idDh";
        SQLQuery q = session.createSQLQuery(sql);
        q.setParameter("idDh", idDh);
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    public void updateDonHang(String ten,String diachi,String ghichu,String sdt,int id){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update DonHang set tenNguoiNhan= :tenNguoiNhan,diaChiNhan= :diaChiNhan ,ghiChu= :ghiChu ,sdtNguoiNhan= :sdtNguoiNhan where id= :id";
        Query q = session.createQuery(sql);
        q.setParameter("tenNguoiNhan", ten);
        q.setParameter("diaChiNhan", diachi);
        q.setParameter("ghiChu", ghichu);
        q.setParameter("sdtNguoiNhan", sdt);
        q.setParameter("id", id);
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
   public void updateChiTietDonHang(int soLuong,float totalprice ,int idSp,int idDh){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update ChiTietDonHang set soLuong= :soLuong,donGia= :donGia where maSanPham = :idSp and maDonHang = :idDh";
        SQLQuery q = session.createSQLQuery(sql);
        q.setParameter("idSp", idSp);
        q.setParameter("idDh", idDh);
        q.setParameter("soLuong", soLuong);
        q.setParameter("donGia", totalprice);
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
   
   public Long count(){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from ChiTietDonHang where status = 1 or status =2");
        
        return Long.parseLong(q.uniqueResult().toString());
   }
    
    
}
