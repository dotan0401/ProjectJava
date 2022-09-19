/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import entity.Cart;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.frontend.ChiTietDonHangDAO;
import dao.frontend.DonHangDAO;
import dao.frontend.HangDAO;
import dao.frontend.NguoiDungDAO;
import dao.frontend.SanPhamDAO; 
import entity.Cart;
import entity.CartCookie;
import entity.DonHang;
import entity.ItemSPCart;
import entity.NguoiDung;
import entity.SanPham;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author bahop
 */
@Controller
public class CartController {

    SanPhamDAO sp;
    NguoiDungDAO nd;
    DonHangDAO dh = null;
    ChiTietDonHangDAO ctdh = null;
    HangDAO hsx = null;

    public CartController() {
        dh = new DonHangDAO();
        sp = new SanPhamDAO();
        hsx = new HangDAO();
        ctdh = new ChiTietDonHangDAO();
    }

    @RequestMapping("/addToCart")
    public String addToCart(@RequestParam(value = "id") int id, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws IOException {
        Gson g = new Gson();
        List<CartCookie> ccs = new ArrayList<>();

        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("cart")) {
                ccs = g.fromJson(cooky.getValue(), new TypeToken<List<CartCookie>>() {
                }.getType());
            }
        }
        Cart cart = null;
        cart = new Cart();
        try {
            SanPhamDAO spDao = new SanPhamDAO();

            for (CartCookie cc : ccs) {
                SanPham sp1 = spDao.getById(cc.getId());
                ItemSPCart t1 = new ItemSPCart(sp1, cc.getQuantity(), cc.getPrice());

                cart.addItem(t1);

            }
            SanPham sp = spDao.getById(id);
            double price = sp.getDonGia();
            ItemSPCart t = new ItemSPCart(sp, 1, price);

            cart.addItem(t);
            ccs.add(new CartCookie(sp.getId(), 1, price));
        } catch (NumberFormatException e) {
        }
        String str = g.toJson(ccs);
        List<ItemSPCart> list = cart.getItems();
        Cookie cookie = new Cookie("cart", str);
        double total = 0;
        double soluong = 0;

        for (ItemSPCart item : list) {
            soluong += item.getQuantity();
            total += item.getPrice() * item.getQuantity();
        }

        response.addCookie(cookie);
        session.setAttribute("cart", list);
        model.addAttribute("cart", list);
        model.addAttribute("total", total);
        model.addAttribute("totalQuan", soluong);
        model.addAttribute("c", sp.getAll());
        model.addAttribute("hsx", hsx.getAll());

        return "FrontEnd/index";
    }

    @RequestMapping("/delete")
    public String deleteToCart(HttpServletRequest request, HttpServletResponse response, Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        Gson g = new Gson();
        List<CartCookie> ccs = new ArrayList<>();

        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("cart")) {
                ccs = g.fromJson(cooky.getValue(), new TypeToken<List<CartCookie>>() {
                }.getType());
            }
        }
        HttpSession session = request.getSession(true);
        Cart c = null;
        c = new Cart();
        ccs.removeIf(x -> x.getId() == id);
        SanPhamDAO spDao = new SanPhamDAO();
        for (CartCookie cc : ccs) {
            SanPham sp1 = spDao.getById(cc.getId());
            ItemSPCart t1 = new ItemSPCart(sp1, cc.getQuantity(), cc.getPrice());
            c.addItem(t1);
        }
        String str = g.toJson(ccs);
        List<ItemSPCart> list = c.getItems();
        Cookie cookie = new Cookie("cart", str);
        double total = 0;
        for (ItemSPCart item : list) {
            total += item.getPrice() * item.getQuantity();
        }

        response.addCookie(cookie);
        model.addAttribute("cart", list);
        model.addAttribute("total", total);
        return "FrontEnd/Cart";

    }

//    @RequestMapping(value = "/quantity_load")
//    public String quantity_load(HttpServletRequest request, HttpServletResponse response, Model model) {
//        String reLoadQuan = request.getParameter("actionQuan");
//        String quan = request.getParameter("quantity");
//        String sanphamId = request.getParameter("sanphamId");
//        int quanAction = 0;
//        int quantity = 0;
//        int id = 0;
//        try {
//            quanAction = Integer.parseInt(reLoadQuan);
//        } catch (Exception e) {
//        }
//
//        try {
//            quantity = Integer.parseInt(quan);
//        } catch (Exception e) {
//        }
//        try {
//            id = Integer.parseInt(sanphamId);
//        } catch (Exception e) {
//        }
//        HttpSession session = request.getSession(true);
//        ArrayList<ItemSPCart> lsiCarts = (ArrayList<ItemSPCart>) session.getAttribute("lsiCarts");
//        int quantityAffter = 0;
//
//        if (quanAction == 1) { //1 thif giamr
//            for (ItemSPCart cart : lsiCarts) {
//                if (cart.getSanPham() == id) {
//                    quantityAffter = cart.getQuantity() - 1;
//                }
//            }
//        } else {// 0 tang
//            for (ItemSPCart cart : lsiCarts) {
//                if (cart.getSanPham() == id) {
//                    quantityAffter = cart.getQuantity() + 1;
//                }
//            }
//        }
//        return "";
    // }
    @RequestMapping(value = "/order")
    public String Order(Model model
    ) {
        return "FrontEnd/Order";
    }
    
     @RequestMapping("/addToCartWishlist")
    public String addToCartWishlist(@RequestParam(value = "id") int id, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws IOException {
        Gson g = new Gson();
        List<CartCookie> ccs = new ArrayList<>();

        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("cart")) {
                ccs = g.fromJson(cooky.getValue(), new TypeToken<List<CartCookie>>() {
                }.getType());
            }
        }
        Cart cart = null;
        cart = new Cart();
        try {
            SanPhamDAO spDao = new SanPhamDAO();

            for (CartCookie cc : ccs) {
                SanPham sp1 = spDao.getById(cc.getId());
                ItemSPCart t1 = new ItemSPCart(sp1, cc.getQuantity(), cc.getPrice());

                cart.addItem(t1);

            }
            SanPham sp = spDao.getById(id);
            double price = sp.getDonGia();
            ItemSPCart t = new ItemSPCart(sp, 1, price);

            cart.addItem(t);
            ccs.add(new CartCookie(sp.getId(), 1, price));
        } catch (NumberFormatException e) {
        }
        String str = g.toJson(ccs);
        List<ItemSPCart> list = cart.getItems();
        Cookie cookie = new Cookie("cart", str);
        double total = 0;
        double soluong = 0;

        for (ItemSPCart item : list) {
            soluong += item.getQuantity();
            total += item.getPrice() * item.getQuantity();
        }

        response.addCookie(cookie);
        session.setAttribute("cart", list);
        model.addAttribute("cart", list);
        model.addAttribute("total", total);
        model.addAttribute("totalQuan", soluong);
        model.addAttribute("c", sp.getAll());
        model.addAttribute("hsx", hsx.getAll());

        return "FrontEnd/Cart";
    }

    
    
    

}
