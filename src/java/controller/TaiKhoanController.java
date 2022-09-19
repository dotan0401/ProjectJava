/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDAO;
import dao.TaiKhoanDAO;
import entity.TaiKhoan;
import entity.VaiTroTaiKhoan;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.portlet.ModelAndView;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Controller
@RequestMapping(value = "Admin/taikhoan")
public class TaiKhoanController {

    TaiKhoanDAO nv = null;
    LoginDAO login = null;

    public TaiKhoanController() {
        nv = new TaiKhoanDAO();
        login = new LoginDAO();
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String nhanvien(Model model, HttpServletRequest request,HttpSession session) {
        int idRole = (int) session.getAttribute("roleId");
        System.out.println(idRole);
        if (idRole == 1) {
            System.out.println("Ko co quyen");
            return "Admin/error";
        }
        int limit = 5;
        long totalRecord = nv.count();
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);

        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        model.addAttribute("counter", nv.countSearch(""));

        model.addAttribute("nhanvien", nv.search("", page));
        return "Admin/taikhoan/list";
    }

    @RequestMapping(value = "addNew", method = RequestMethod.GET)
    public String insertForm(@ModelAttribute("nhanvien") TaiKhoan nhanvien,HttpSession session) {
        int idRole = (int) session.getAttribute("roleId");
        System.out.println(idRole);
        if (idRole == 1) {
            System.out.println("Ko co quyen");
            return "Admin/error";
        }
        return "Admin/taikhoan/insert";
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String searchTaiKhoan(Model model, HttpServletRequest request,HttpSession session) {
        int idRole = (int) session.getAttribute("roleId");
        System.out.println(idRole);
        if (idRole == 1) {
            System.out.println("Ko co quyen");
            return "Admin/error";
        }
        TaiKhoan taikhoan = new TaiKhoan();
        int limit = 5;
        long totalRecord = nv.countSearch(request.getParameter("keyword"));
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);

        String keyString = request.getParameter("keyword");
        if (keyString == null) {
            keyString = "";
        }

        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        System.out.println(request.getParameter("page"));

        List<TaiKhoan> listSearch = nv.search(request.getParameter("keyword"), page);

        if (listSearch == null) {

            System.out.println("Khong tim thay ket qua");
            model.addAttribute("err", "Khong tim thay ket qua");
        } else {
            model.addAttribute("nhanvien", listSearch);

        }
        return "Admin/taikhoan/list";
    }

    @RequestMapping(value = "addNhanVien", method = RequestMethod.POST)
    public String insert(@ModelAttribute("nhanvien") TaiKhoan tk, HttpServletRequest request, Model model,HttpSession session) {

        int idRole = (int) session.getAttribute("roleId");
        System.out.println(idRole);
        if (idRole == 1) {
            System.out.println("Ko co quyen");
            return "Admin/error";
        }
        if (login.checkEmail(request.getParameter("email"))) {
               model.addAttribute("errEmail", "Email đã tồn tại");
            return "Admin/taikhoan/insert";
        }else if(login.checkPhone(request.getParameter("sdt"))){
                 model.addAttribute("errSdt", "SĐT đã tồn tại");
                return "Admin/taikhoan/insert";
        } else {
                tk.setId(Integer.SIZE);
                tk.setHoTen(request.getParameter("hoTen"));
                tk.setDiaChi(request.getParameter("diaChi"));
                tk.setEmail(request.getParameter("email"));
                tk.setSdt(request.getParameter("sdt"));
                tk.setPassword(request.getParameter("password"));
                tk.setStatus(Boolean.TRUE);
                tk.setNgayTao(new Date());
                tk.setNgayCapNhat(null);
                nv.insert(tk);
                model.addAttribute("taikhoan", tk);
        }
        return "redirect:list";
    }
    @RequestMapping(value = "initupdate")
    public String update(Model model,HttpServletRequest request,@RequestParam int id,HttpSession session) {
        int idRole = (int) session.getAttribute("roleId");
        System.out.println(idRole);
        if (idRole == 1) {
            System.out.println("Ko co quyen");
            return "Admin/error";
        }
       TaiKhoan tk = nv.getById(id);
        model.addAttribute("taikhoan", tk);
        return "Admin/taikhoan/update";
    }
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(Model model,HttpServletRequest request,HttpSession session){
        int idRole = (int) session.getAttribute("roleId");
        System.out.println(idRole);
        if (idRole == 1) {
            System.out.println("Ko co quyen");
            return "Admin/error";
        }
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Boolean status = Boolean.parseBoolean(request.getParameter("status"));
        System.out.println(status);
        String name =request.getParameter("hoTen");
        String diachi =request.getParameter("diaChi");
        String pass = request.getParameter("password");
        nv.update(id,name, diachi,pass,status);
      
        return "redirect:list";
    }
    
    

//    @RequestMapping(value = "addNhanVien", method = RequestMethod.POST)
//    public String insert(@RequestParam("imgFile") CommonsMultipartFile imgFile, HttpServletRequest request,Model model){
//       String nameFile = imgFile.getOriginalFilename();
//        if (!nameFile.equals("")) {
//            String destFile = request.getServletContext().getRealPath("resources/images");
//            String dest = destFile+"/"+nameFile;
//            System.out.println(dest);
//            File file = new File(destFile);
//            System.out.println(file);
//            if (!file.exists()) {
//                file.mkdir();
//            }
//           try {
//               imgFile.transferTo(new File(file+File.separator+nameFile));
//               
//               System.out.println("Tên file :"+nameFile);
//               model.addAttribute("anh",nameFile);
//               System.out.println("Them thanh cong");
//           } catch (IOException ex) {
//               System.out.println("Them That bai");
//               Logger.getLogger(TaiKhoanController.class.getName()).log(Level.SEVERE, null, ex);
//           } 
//        }
//
//        return "redirect:list";
//    }
    
    @RequestMapping(value = "listTK", method = RequestMethod.GET)
    public String index(Model model) {
        VaiTroTaiKhoan hsx = new VaiTroTaiKhoan();
        model.addAttribute("taikhoan", nv.getAll());
        return "Admin/taikhoan/listTK";
    }
    
}
