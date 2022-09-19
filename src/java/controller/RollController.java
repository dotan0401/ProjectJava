/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.VaiTroDAO;
import entity.VaiTro;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Controller
@RequestMapping(value = "Admin/vaitro")
public class RollController {
    
    VaiTroDAO vt = null;

    public RollController() {
        vt=new VaiTroDAO();
    }
    @RequestMapping(value = "list")
    public String list(Model model){
        model.addAttribute("vaitro", vt.getAll());
          return "Admin/vaitro/list";
    }
    
    
}
