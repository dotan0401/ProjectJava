/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HangSanXuatDAO;
import entity.HangSanXuat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Controller
@RequestMapping(value = "Admin/hangsanxuat")
public class HangSxController {
    
    HangSanXuatDAO hsxDao = null;
    
    public HangSxController() {
        hsxDao = new HangSanXuatDAO();
    }
    
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String index(Model model) {
        HangSanXuat hsx = new HangSanXuat();
        model.addAttribute("hsx", hsxDao.getAll());
        return "Admin/hangsanxuat/list";
    }
    
    @RequestMapping(value = "addnew")
    public String insertForm(Model model) {
        HangSanXuat hsx = new HangSanXuat();
        model.addAttribute("hsx", hsx);
        return "Admin/hangsanxuat/insert";
    }
    
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String insert(HangSanXuat hsx, Model model, HttpServletRequest request) {
       
        String name = request.getParameter("name");
       
       
        model.addAttribute("hsx", hsx);
       
            if (!hsxDao.checkName(request.getParameter("name"))) {
                hsx.setId(Integer.SIZE);
                hsx.setTen(request.getParameter("name"));
                hsx.setStatus(Boolean.TRUE);
                hsx.setNgayTao(new Date());
                hsx.setNgayCapNhat(null);
                hsxDao.insert(hsx);
                model.addAttribute("hsx", hsx);
                model.addAttribute("err", "");
            } else {
                model.addAttribute("err", "Da ton tai ");
                System.out.println(request.getParameter("name"));
                return "Admin/hangsanxuat/insert";
            }
        
        
        return "redirect:list";
    }

    @RequestMapping(value = "initupdate")
    public String update(Model model, HttpServletRequest request, @RequestParam int id) {
        HangSanXuat hsx = hsxDao.getById(id);
        model.addAttribute("hsx", hsx);
        return "Admin/hangsanxuat/update";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(Model model, HttpServletRequest request) {
        String name = request.getParameter("name");
        Boolean status = Boolean.parseBoolean(request.getParameter("status"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        hsxDao.update(name, false, id);
        return "redirect:list";
    }
    
}
