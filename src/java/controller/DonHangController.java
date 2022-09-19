/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DonHangDAO;
import dao.SanPhamDAO;
import entity.ChiTietDonHang;
import entity.DonHang;
import entity.SanPham;
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
@RequestMapping(value = "Admin/donhang")
public class DonHangController {
    DonHangDAO dh ;
    SanPhamDAO sp;

    public DonHangController() {
        dh = new DonHangDAO();
        sp = new SanPhamDAO();
    }
    
     @RequestMapping(value = "list", method = RequestMethod.GET)
    public String donhang(Model model,HttpServletRequest request) {
        int limit = 5;
        long totalRecord = dh.count();
        System.out.println(totalRecord);
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);
         System.out.println(totalPage);
        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        
        model.addAttribute("donhang", dh.getAll(page));
        return "Admin/donhang/list";
    }
    @RequestMapping(value = "listSuccessfully", method = RequestMethod.GET)
    public String listsuccess(Model model,HttpServletRequest request) {
        
        int limit = 5;
        long totalRecord = dh.count();
        System.out.println(totalRecord);
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);
         System.out.println(totalPage);
        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        
        
        model.addAttribute("donhang", dh.findAllDonHoanThanh());
        return "Admin/donhang/list";
    }
    @RequestMapping(value = "listHuy", method = RequestMethod.GET)
    public String listHuy(Model model,HttpServletRequest request) {
        
        
        int limit = 5;
        long totalRecord = dh.count();
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);
        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        
        model.addAttribute("donhang", dh.findAllDonHuy());
        return "Admin/donhang/list";
    }
    @RequestMapping(value = "listConfirm", method = RequestMethod.GET)
    public String listConfirm(Model model,HttpServletRequest request) {
        
        
        int limit = 5;
        long totalRecord = dh.count();
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);
        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        
        
        model.addAttribute("donhang", dh.findAllXacnhan());
        return "Admin/donhang/list";
    }
    @RequestMapping(value = "listDelivery", method = RequestMethod.GET)
    public String listDelivery(Model model,HttpServletRequest request) {
        
        int limit = 5;
        long totalRecord = dh.count();
        long totalPage = (long) Math.ceil((float) totalRecord / (float) limit);
        model.addAttribute("totalPage", (int) totalPage);
        model.addAttribute("counter", (int) totalRecord);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        model.addAttribute("donhang", dh.findAllGiaoHang());
        return "Admin/donhang/list";
    }
    @RequestMapping(value = "updateStaus1", method = RequestMethod.GET)
    public String updateStaus(Model model, HttpServletRequest request, @RequestParam  int idSP,@RequestParam int idDh){ 
        
        SanPham sanpham = sp.getById(idSP);
        ChiTietDonHang ctdh = dh.getByIdSP(idSP, idDh);
//        ChiTietDonHang ctdh = sp.getById(idSP);
//        ChiTietDonHang ctdh = dh.getByIdSP(idSP);
        
//        System.out.println(ctdh.getStatus());
        
        
        long donviban = sanpham.getDonViBan();
        long donvikho = sanpham.getDonViKho();
        
        long soluong = ctdh.getSoLuong();
        
        long daban = donviban+soluong;
        long trongkho = donvikho-soluong;
        
        System.out.println(daban);
        System.out.println(trongkho);
        dh.update(daban, trongkho, idSP);
        dh.updateChiTietS2(2, idSP, idDh);
        
//        System.out.println(ctdh.getStatus());
//        System.out.println(sanpham.getId());
//        System.out.println(idDh);
        return "redirect:list";
    }
    @RequestMapping(value = "updateStaus2", method = RequestMethod.GET)
    public String updateStaus2(@RequestParam  int idSP,@RequestParam int idDh){ 
        SanPham sanpham = sp.getById(idSP);
        ChiTietDonHang ctdh = dh.getByIdSP(idSP, idDh);
        dh.updateChiTietS3(3, idSP, idDh);
        return "redirect:list";
    }
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam  int idSP,@RequestParam int idDh){
       SanPham sanpham = sp.getById(idSP);
        ChiTietDonHang ctdh = dh.getByIdSP(idSP, idDh);
        dh.updateChiTiet(4, idSP, idDh);
        return "redirect:list";
    }
    @RequestMapping(value = "initupdate", method = RequestMethod.GET)
    public String updatedonhang(@RequestParam int idSP,@RequestParam int idDh,Model model){
        model.addAttribute("donhang", dh.getById(idDh));
        model.addAttribute("chitiet", dh.getByIdSP(idSP, idDh));
        model.addAttribute("idSP", idSP);
        return "Admin/donhang/update";
    }
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(HttpServletRequest request){
        int idSP = Integer.parseInt(request.getParameter("idSP"));
        
        int idDh = Integer.parseInt(request.getParameter("idDh"));
        System.out.println(idSP + idDh);
        String ten = request.getParameter("tenNguoiNhan");
        String diachi = request.getParameter("diaChiNhan");
        String sdt = request.getParameter("sdtNguoiNhan");
        String ghichu = request.getParameter("ghiChu");
        
        dh.updateDonHang(ten, diachi,ghichu,sdt, idDh);
        
        SanPham sanpham = sp.getById(idSP);
        float dongia =(float) sanpham.getDonGia();
        int soluong = Integer.parseInt(request.getParameter("soluong"));
        float totalPrice = dongia*soluong;
        System.out.println("Tổng giá :"+totalPrice);
        
        dh.updateChiTietDonHang(soluong, totalPrice, idSP, idDh);
        return "redirect:list";
    }
}
