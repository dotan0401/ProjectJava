/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.VaiTroTaiKhoan;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HOANG LAN COMPUTER
 */
public class VaiTroTaiKhoanDAO {
    Session session;
    public List<VaiTroTaiKhoan> getAll(){
        session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("select tk.id ,tk.name ,tk.email ,vt.id ,vt.ten ,vttk.status,vttk.ngayTao,vttk.ngayCapNhat from VaiTroTaiKhoan vttk inner join TaiKhoan tk on vttk.maTaiKhoan=tk.id inner join VaiTro vt on vttk.maVaiTro=tk.id");
        List<VaiTroTaiKhoan> list = q.list();
        session.close();
        return list;
    }
}
