/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.TaiKhoanUserDAO;
import entity.NguoiDung;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Controller
@RequestMapping(value = "Admin/taikhoanUser")
public class TaiKhoanUserController {
    TaiKhoanUserDAO tkuser =null;

    
    public TaiKhoanUserController() {
        tkuser = new TaiKhoanUserDAO();
    }
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(Model model){
        model.addAttribute("tkuser", tkuser.getAll());
        return "Admin/taikhoanUser/list";
    }
    @RequestMapping(value = "addnew",method = RequestMethod.GET)
    public String addnewform(Model model){
        NguoiDung user = new NguoiDung();
        model.addAttribute("tkuser", user);
        return "Admin/taikhoanUser/insert";
        
    }
    @RequestMapping(value = "insert",method = RequestMethod.POST)
    public String insert(@ModelAttribute("tkuser") NguoiDung user, HttpServletRequest request, Model model){
        if (tkuser.checkEmail(request.getParameter("email"))) {
               model.addAttribute("errEmail", "Email đã tồn tại");
            return "Admin/taikhoanUser/insert";
        }else if(tkuser.checkPhone(request.getParameter("sdt"))){
            model.addAttribute("errSdt", "SĐT đã tồn tại");
                return "Admin/taikhoanUser/insert";
        } else {
                user.setId(Integer.SIZE);
                user.setHoTen(request.getParameter("hoTen"));
                user.setDiaChi(request.getParameter("diaChi"));
                user.setEmail(request.getParameter("email"));
                user.setSdt(request.getParameter("sdt"));
                user.setPassword(request.getParameter("password"));
                user.setStatus(Boolean.TRUE);
                user.setNgayTao(new Date());
                user.setNgayCapNhat(null);
                tkuser.insert(user);
                model.addAttribute("taikhoan", user);
        }
        return "redirect:list";
    }
    @RequestMapping(value = "initupdate",method = RequestMethod.GET)
    public String update(Model model,HttpServletRequest request,@RequestParam int id) {
       NguoiDung tkusers = tkuser.getById(id);
        model.addAttribute("tkuser", tkusers);
        return "Admin/taikhoanUser/update";
    }
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(Model model,HttpServletRequest request){
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Boolean status = Boolean.parseBoolean(request.getParameter("status"));
        System.out.println(status);
        String name =request.getParameter("hoTen");
        String diachi =request.getParameter("diaChi");
        String pass = request.getParameter("password");
        tkuser.update(id,name, diachi,pass,status);
      
        return "redirect:list";
    }
    @RequestMapping(value = "ban", method = RequestMethod.GET)
    public String banned(@RequestParam int id){
        tkuser.updateStatus(false, id);
        return "redirect:list";
    }
    @RequestMapping(value = "open", method = RequestMethod.GET)
    public String opened(@RequestParam int id){
        tkuser.updateStatus(true, id);
        return "redirect:list";
    }
    
    
    
}
