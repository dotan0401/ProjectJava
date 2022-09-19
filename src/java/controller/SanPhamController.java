/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HangSanXuatDAO;
import dao.SanPhamDAO;
import entity.Anh;
import entity.HangSanXuat;
import entity.Image;
import entity.SanPham;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Controller
@RequestMapping(value = "Admin/sanpham", method = RequestMethod.GET)
public class SanPhamController {

    SanPhamDAO sp;
    HangSanXuatDAO hsx;

    public SanPhamController() {
        sp = new SanPhamDAO();
        hsx = new HangSanXuatDAO();
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model, HttpServletRequest request) {
        int limit = 5;
        long totalRecord = sp.count();
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);

        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        model.addAttribute("counter", sp.countSearch(""));

        model.addAttribute("sp", sp.search("", page));
        

        return "Admin/sanpham/list";
    }

    
    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String searchTaiKhoan(Model model, HttpServletRequest request) {
        SanPham taikhoan = new SanPham();
        int limit = 5;
        long totalRecord = sp.countSearch(request.getParameter("keyword"));
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

        List<SanPham> listSearch = sp.search(request.getParameter("keyword"), page);

        if (listSearch == null) {

            System.out.println("Khong tim thay ket qua");
            model.addAttribute("err", "Khong tim thay ket qua");
        } else {
            model.addAttribute("sp", listSearch);

        }
        return "Admin/sanpham/list";
    }
    
    @RequestMapping(value = "addnew")
    public String insertForm(Model model) {

        model.addAttribute("hsx", hsx.fildAllByStatus());

        return "Admin/sanpham/insert";
    }

    @RequestMapping(value = "detail")
    public String detail(Model model, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));

       model.addAttribute("anh", sp.findAllAnh(id));
        
        model.addAttribute("sp", sp.getById(id));
        return "Admin/sanpham/detail";
    }

    @RequestMapping(value = "listImage")
    public String anh(Model model, HttpServletRequest request, HttpSession session) {
        int id = Integer.parseInt(request.getParameter("id"));
        session.setAttribute("idPro", id);

        SanPham sanpham = sp.getById(id);
        model.addAttribute("idsanppham", sanpham.getId());
        model.addAttribute("tensanppham", sanpham.getTen());

        model.addAttribute("anh", sp.findAllAnh(id));
        return "Admin/sanpham/listImage";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(Model model, HttpServletRequest request) {

        String name = request.getParameter("hangSanXuat");
        HangSanXuat hang = hsx.findByName(name);

        String nameSP = request.getParameter("ten");
        int id = hang.getId();
        SanPham p = new SanPham();

        if (!sp.checkName(nameSP)) {
            p.setId(Integer.MIN_VALUE);
        p.setTen(request.getParameter("ten"));
        p.setCpu(request.getParameter("cpu"));
        p.setMain(request.getParameter("main"));
        p.setCongGiaoTiep(request.getParameter("congGiaoTiep"));
        p.setAudio(request.getParameter("audio"));
        p.setBanPhim(request.getParameter("banPhim"));
        p.setManHinh(request.getParameter("manHinh"));
        p.setTrongLuong(Double.parseDouble(request.getParameter("trongLuong")));
        p.setMauSac(request.getParameter("mauSac"));
        p.setKichThuoc(request.getParameter("kichThuoc"));
        p.setDonGia(Float.parseFloat(request.getParameter("donGia")));
        p.setDonViKho(Long.parseLong(request.getParameter("donViKho")));
        p.setDonViBan(0);
        p.setHdd(request.getParameter("hdd"));
        p.setSsd(request.getParameter("ssd"));
        p.setVga(request.getParameter("vga"));
        p.setDungLuongPin(request.getParameter("dungLuongPin"));
        p.setHeDieuHanh(request.getParameter("heDieuHanh"));
        p.setRam(request.getParameter("ram"));
        p.setThietKe(request.getParameter("thietKe"));
        p.setThongTinBaoHanh(request.getParameter("baoHanh"));
        p.setThongTinChung(request.getParameter("thongTinChung"));
        p.setMaHangSanXuat(new HangSanXuat(id));
        p.setStatus(Boolean.TRUE);
        p.setNgayTao(new Date());
        sp.insert(p);
        }
        else{
            model.addAttribute("hsx", hsx.fildAllByStatus());
            model.addAttribute("errName", "Tên sản phẩm đã tồn tại !!");
            return "Admin/sanpham/insert";
        }
        return "redirect:list";
    }

    @RequestMapping(value = "addnewimage", method = RequestMethod.GET)
    public String forminsert() {
        return "Admin/sanpham/insertImage";
    }

    @RequestMapping(value = "initupdateImage", method = RequestMethod.GET)
    public String formUpdate(Model model, @RequestParam int id) {
        Anh anh = sp.getByIdAnh(id);
        model.addAttribute("anh", anh);
        return "Admin/sanpham/updateImage";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String add(@RequestParam("multipartFile") CommonsMultipartFile commonsMultipartFile, HttpServletRequest request, Model model, HttpSession session) {

        int id = (int) session.getAttribute("idPro");
        System.out.println(id);
        model.addAttribute("anh", sp.findAllAnh(id));

        String nameFile = commonsMultipartFile.getOriginalFilename();
        String dirFile = request.getServletContext().getRealPath("/resources/images/product");
        File file = new File(dirFile);
        File dest = new File(file.getAbsoluteFile() + "/" + commonsMultipartFile.getOriginalFilename());

        if (!sp.checkNameFile(nameFile)) {
            if (!dest.exists()) {
                try {
                    Files.write(dest.toPath(), commonsMultipartFile.getBytes(), StandardOpenOption.CREATE);
                } catch (IOException ex) {
                    Logger.getLogger(SanPhamController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            Anh a = new Anh();
            a.setId(Integer.MIN_VALUE);
            a.setUrl(nameFile);
            a.setStatus(Boolean.TRUE);
            a.setNgayTao(new Date());
            a.setNgayCapNhat(null);
            a.setMaSanPham(new SanPham(id));
            sp.insertImage(a);
        } else {
            model.addAttribute("err", "Ảnh đã tồn tại !");
            return "Admin/sanpham/insertImage";
        }
        return "redirect:list";
    }

    @RequestMapping(value = "updateImage", method = RequestMethod.POST)
    public String updateImage(@RequestParam("multipartFile") CommonsMultipartFile commonsMultipartFile, HttpServletRequest request, Model model, HttpSession session) {

        int id = (int) session.getAttribute("idPro");
        
        SanPham sanpham = sp.getById(id);
        model.addAttribute("idsanppham", sanpham.getId());
        model.addAttribute("tensanppham", sanpham.getTen());

        List<Image> anhsp = sp.findAllAnh(id);

        model.addAttribute("anh", anhsp);

        String dirFile = request.getServletContext().getRealPath("/resources/images/product");
        String nameFile = commonsMultipartFile.getOriginalFilename();

        File file = new File(dirFile);

        File dest = new File(file.getAbsoluteFile() + "/" + commonsMultipartFile.getOriginalFilename());

        
        int idAnh = Integer.parseInt(request.getParameter("id"));
         boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Anh anh1 = sp.getByIdAnh(idAnh);
            if (nameFile == null || nameFile == "") {
                nameFile = anh1.getUrl();
            }
        if (!sp.checkNameFile(nameFile)) {
            if (!dest.exists()) {
                try {
                    Files.write(dest.toPath(), commonsMultipartFile.getBytes(), StandardOpenOption.CREATE);
                } catch (IOException ex) {
                    Logger.getLogger(SanPhamController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            sp.updateImage(nameFile, status, idAnh);
        } else {
            model.addAttribute("err", "Ảnh đã tồn tại");
            return "Admin/sanpham/listImage";
        }
        return "redirect:list";
    }

    @RequestMapping(value = "update")
    public String update(Model model, HttpServletRequest request, @RequestParam int id, @RequestParam int idCat) {
        SanPham sanpham = sp.getById(id);
        model.addAttribute("sp", sanpham);

        model.addAttribute("hsx", hsx.fildAllByStatus());

        HangSanXuat hang = hsx.getById(idCat);

        model.addAttribute("nameCat", hang.getTen());
        return "Admin/sanpham/update";
    }

    @RequestMapping(value = "initupdate", method = RequestMethod.POST)
    public String updateSP(Model model, HttpServletRequest request) {
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));

        String Ten = request.getParameter("ten");

        String Cpu = request.getParameter("cpu");
        String Main = request.getParameter("main");
        String CongGiaoTiep = request.getParameter("congGiaoTiep");
        String Audio = request.getParameter("audio");
        String BanPhim = request.getParameter("banPhim");
        String ManHinh = request.getParameter("manHinh");
        float TrongLuong = Float.parseFloat(request.getParameter("trongLuong"));
        String MauSac = request.getParameter("mauSac");
        String KichThuoc = request.getParameter("kichThuoc");
        float DonGia = Float.parseFloat(request.getParameter("donGia"));
        long DonViKho = Long.parseLong(request.getParameter("donViKho"));

        String Hdd = request.getParameter("hdd");
        String Ssd = request.getParameter("ssd");
        String Vga = request.getParameter("vga");
        String DungLuongPin = request.getParameter("dungLuongPin");
        String HeDieuHanh = request.getParameter("heDieuHanh");
        String Ram = request.getParameter("ram");
        String ThietKe = request.getParameter("thietKe");
        String ThongTinBaoHanh = request.getParameter("baoHanh");
        String ThongTinChung = request.getParameter("thongTinChung");
//        String MaHangSanXuat(new HangSanXuat(id));
        Boolean Status = Boolean.parseBoolean(request.getParameter("status"));
        sp.update(Ten, Cpu, Main, CongGiaoTiep, Audio, BanPhim, DonGia, MauSac, KichThuoc, DonGia, DonViKho, Hdd, Ssd, Vga, DungLuongPin, HeDieuHanh, ManHinh, Ram, ThietKe, ThongTinBaoHanh, ThongTinChung, Status, id);
        return "redirect:list";
    }

}
