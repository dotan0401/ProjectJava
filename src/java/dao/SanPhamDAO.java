/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Anh;
import entity.NguoiDung;
import entity.SanPham;
import java.util.List;
import entity.Image;
import java.util.Date;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author bahop
 */
public class SanPhamDAO {

    Session session;

    public SanPhamDAO() {

    }

    public List<NguoiDung> getAll() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham c");
        List<NguoiDung> re = q.list();
        session.close();
        return re;
    }
    
    
    public Long count (){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from SanPham");
        
        return Long.parseLong(q.uniqueResult().toString());
   }
   public Long countSearch (String name){
       session = HibernateUtil.getSessionFactory().openSession();
        
        Query q = session.createQuery("select count(*) from SanPham tk where tk.ten like :name");
        q.setString("name", "%"+name+"%");
        return Long.parseLong(q.uniqueResult().toString());
   }
   
   public List<SanPham> search(String name,int page){
        session = HibernateUtil.getSessionFactory().openSession();
        int max=5;
        Query q = session.createQuery("from SanPham tk where tk.ten like :name ORDER BY id desc");
        q.setString("name", "%"+name+"%");
         q.setMaxResults(max);
        q.setFirstResult((page-1)*max);
        List<SanPham> list = q.list();
        session.close();
        return list;
    }
    public List<SanPham> findAll() {
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from SanPham");
//        Query q = session.createQuery("select sp.id,sp.ten,sp.cpu,sp.main,sp.congGiaoTiep,sp.audio,sp.banPhim,sp.trongLuong,sp.mauSac,sp.kichThuoc,sp.donGia,sp.donViBan,sp.donViKho,sp.hdd,sp.ssd,sp.vga,sp.dungLuongPin,sp.heDieuHanh,sp.manHinh,sp.ram,sp.thietKe,sp.thongTinBaoHanh,sp.thongTinChung,sp.status,sp.ngayTao,sp.ngayCapNhat,hsx.id,hsx.ten,anh.Url from SanPham sp join HangSanXuat hsx on sp.maHangSanXuat=hsx.id join Anh anh on sp.id=anh.MaSanPham");
        List<SanPham> list = q.list();
        session.close();
        return list;
    }
    public SanPham getById(int id){
        session = HibernateUtil.getSessionFactory().openSession();
        return  (SanPham) session.get(SanPham.class, id);
    }
    public Anh getByIdAnh(int id){
        session = HibernateUtil.getSessionFactory().openSession();

        Query query = session.createQuery("from Anh where id= :id");
        query.setParameter("id", id);
        Anh taikhoan = (Anh) query.uniqueResult();
        session.close();
        return taikhoan;
    }
    
    public List<Image> findAllAnh(int id) {
        session = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q =  session.createSQLQuery("select * from Anh where maSanPham= :id");
        q.addEntity(Image.class);
        q.setParameter("id", id);
        List<Image> list = q.list();
        session.close();
        return list;
    }
    
    public void insert(SanPham sp){
    session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(sp);
        session.getTransaction().commit();
        session.close();
    }
    public void update(String Ten, String Cpu,String Main,String CongGiaoTiep,String Audio,String BanPhim,float TrongLuong,String MauSac,String KichThuoc,float DonGia,long DonViKho,String HDD,String SSD,String VGA,String DungLuongPin,String HeDieuHanh,String ManHinh,String Ram,String ThietKe,String ThongTinBaoHanh,String ThongTinChung,boolean Status,int id){
         session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update SanPham set Ten= :Ten ,Cpu= :Cpu ,Main= :Main ,CongGiaoTiep= :CongGiaoTiep ,Audio= :Audio ,BanPhim= :BanPhim,TrongLuong= :TrongLuong ,MauSac= :MauSac ,KichThuoc= :KichThuoc,DonGia= :DonGia ,DonViKho= :DonViKho,hdd= :hdd ,ssd= :ssd ,vga= :vga,DungLuongPin= :DungLuongPin ,HeDieuHanh= :HeDieuHanh ,ManHinh= :ManHinh,Ram= :Ram ,ThietKe= :ThietKe ,ThongTinBaoHanh= :ThongTinBaoHanh ,ThongTinChung= :ThongTinChung,Status= :Status,ngayCapNhat= :ngayCapNhat  where id= :id";
        
        Query q = session.createQuery(sql);
        q.setParameter("Ten", Ten);
        q.setParameter("Cpu", Cpu);
        q.setParameter("Main", Main);
        q.setParameter("CongGiaoTiep", CongGiaoTiep);
        q.setParameter("Audio", Audio);
        q.setParameter("BanPhim", BanPhim);
        q.setParameter("TrongLuong", TrongLuong);
        q.setParameter("MauSac", MauSac);
        q.setParameter("KichThuoc", KichThuoc);
        q.setParameter("DonGia", DonGia);
        q.setParameter("DonViKho", DonViKho);
        q.setParameter("hdd", HDD);
        q.setParameter("ssd", SSD);
        q.setParameter("vga", VGA);
        q.setParameter("DungLuongPin", DungLuongPin);
        q.setParameter("HeDieuHanh", HeDieuHanh);
        q.setParameter("ManHinh", ManHinh);
        q.setParameter("Ram", Ram);
        q.setParameter("ThietKe", ThietKe);
        q.setParameter("ThongTinBaoHanh", ThongTinBaoHanh);
        q.setParameter("ThongTinChung", ThongTinChung);
//        q.setParameter("MaHangSanXuat", Ten);
        q.setParameter("Status", Status);
        q.setParameter("id", id);
        q.setParameter("ngayCapNhat", new Date());
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
        session = HibernateUtil.getSessionFactory().openSession();
    }
//    public void updateStatusSanPham(boolean status,int id){
//        session = HibernateUtil.getSessionFactory().openSession();
//        String sql = "update SanPham set status= :status,ngayCapNhat = :ngayCapNhat where id= :id";
//
//        Query q = session.createQuery(sql);
//        q.setParameter("status", status);
//        q.setParameter("id", id);
//        q.setParameter("ngayCapNhat", new Date());
//        session.beginTransaction();
//        q.executeUpdate();
//        session.getTransaction().commit();
//        session.close();
//    }
    public void insertImage(Anh a){
    session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(a);
        session.getTransaction().commit();
        session.close();
    }
    public void updateImage(String url,boolean status,int id){
        session = HibernateUtil.getSessionFactory().openSession();
        String sql = "update Anh set url= :url ,status= :status ,ngayCapNhat= :ngayCapNhat where id= :id";

        Query q = session.createQuery(sql);
        q.setParameter("url", url);
        q.setParameter("status", status);
        q.setParameter("id", id);
        q.setParameter("ngayCapNhat", new Date());
        session.beginTransaction();
        q.executeUpdate();
        session.getTransaction().commit();
        session.close();
    }
    
    public boolean checkNameFile(String nameFile){
         session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "from Anh a where a.url= :url";
        Query q = session.createQuery(sql);
        q.setParameter("url", nameFile);
        List list = q.list();
        if ((list != null) && (list.size() > 0)) {
            userFound = true;
        }
        session.close();
        return userFound;
    }
    public boolean checkName(String name) {
        session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        String sql = "from SanPham hsx where hsx.ten=?";
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
