/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDAO;
import dao.TaiKhoanDAO;
import entity.TaiKhoan;
import entity.TaiKhoan;
import entity.VaiTroTaiKhoan;
import static java.lang.System.console;
import java.util.Date;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Controller
@RequestMapping("Admin")
public class LoginController {

    LoginDAO login = null;
    TaiKhoanDAO nv = null;

    public LoginController() {
        login = new LoginDAO();
        nv = new TaiKhoanDAO();
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String showFormLogin(Model model) {
        TaiKhoan nv = new TaiKhoan();
        model.addAttribute("nv", nv);
        return "Admin/taikhoan/login";
    }

    @RequestMapping(value = "siginForm", method = RequestMethod.POST)
    public String processForm(Model model, HttpServletRequest request, HttpServletResponse response) {
        VaiTroTaiKhoan nv = new VaiTroTaiKhoan();
        model.addAttribute("nv", nv);
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean check = login.checkLogin(email, password);
        if (check) {
            HttpSession session = request.getSession();
            TaiKhoan taikhoan = login.getByEmail(email);
            session.setAttribute("email", email);
            
            session.setAttribute("id", taikhoan.getId());
            session.setAttribute("name", taikhoan.getHoTen());
            for(VaiTroTaiKhoan vt : taikhoan.getVaiTroTaiKhoanCollection()){
                    session.setAttribute("roleId", vt.getVaiTro().getId());
                    session.setAttribute("roleName", vt.getVaiTro().getTen());
                    
              }
            
            session.setMaxInactiveInterval(6000);

            //xử lí cookie
            if (request.getParameter("remember") != null) {
                Cookie e = new Cookie("email", email);
                e.setMaxAge(6000);
                Cookie p = new Cookie("password", password);
                e.setMaxAge(6000);

                //gui cookie
                response.addCookie(e);
                response.addCookie(p);
            }

            return "redirect:home";
        } else {
            model.addAttribute("err", "Sai email hoặc password");
        }
        return "Admin/taikhoan/login";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(Model model, HttpServletRequest request) {
        model.addAttribute("nv", new TaiKhoan());
        HttpSession session = request.getSession();
        if (session.getAttribute("email") != null) {
            session.invalidate();
        }
        return "Admin/home";
    }

    @RequestMapping(value = "formRegister", method = RequestMethod.GET)
    public String formRegister(@ModelAttribute("nv") TaiKhoan nv) {
        return "Admin/taikhoan/register";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(@ModelAttribute("nv") TaiKhoan nv, HttpServletRequest request,Model model) {
        TaiKhoanDAO nvdao = new TaiKhoanDAO();
        String email = request.getParameter("email");
        String phone = request.getParameter("sdt");
        boolean check = true;
                
        
        if (check) {
            if (!login.checkEmail(email)) {
            if (!login.checkPhone(phone)) {
                nv.setId(Integer.SIZE);
                nv.setHoTen(request.getParameter("hoTen"));
                nv.setDiaChi(request.getParameter("diaChi"));
                nv.setEmail(request.getParameter("email"));
                nv.setPassword(request.getParameter("password"));
                nv.setSdt(request.getParameter("sdt"));
                nv.setStatus(Boolean.TRUE);
                nv.setNgayTao(new Date());
                nv.setNgayCapNhat(null);
                nvdao.insert(nv);
                return "Admin/taikhoan/login";
            } else {
                model.addAttribute("errSDT", "Số điện thoại đã tồn tại");
                System.out.println("sdt đã tồn tại");
                return "Admin/taikhoan/register";
            }
        } else {
            model.addAttribute("errEmail", "Email đã tồn tại");
            System.out.println("email đã tồn tại");
                return "Admin/taikhoan/register";
        }
        }else{
            model.addAttribute("mess", "ok");
        }
       return "Admin/taikhoan/login";
       
    }

    @RequestMapping(value = "forgot_password", method = RequestMethod.GET)
    public String forgot() {
        return "Admin/taikhoan/forgot_password";
    }
    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public String profile(Model model,HttpServletRequest request,HttpSession session) {
       String email=(String) session.getAttribute("email");
        
        model.addAttribute("taikhoan", login.getByEmail(email));
        return "Admin/taikhoan/profile";
    }
    @RequestMapping(value = "updateProfile", method = RequestMethod.POST)
    public String update(HttpSession session,Model model,HttpServletRequest request){
        
       int id = (int) session.getAttribute("id");
        
        String name =request.getParameter("hoTen");
        String diachi =request.getParameter("diaChi");
        login.update(id,name, diachi);
       session.setAttribute("name", name    );
        return "Admin/home";
    }

}
