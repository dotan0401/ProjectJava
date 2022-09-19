 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.frontend.ChiTietDonHangDAO;
import dao.frontend.DonHangDAO;
import dao.frontend.HangDAO;
import dao.frontend.NguoiDungDAO;
import dao.frontend.SanPhamDAO;
import entity.Cart;
import entity.CartCookie;
import entity.ChiTietDonHang;
import entity.ChiTietDonHangPK;
import entity.DonHang;
import entity.HangSanXuat;
import entity.ItemSPCart;
import entity.NguoiDung;
import entity.SanPham;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author bahop
 */
@Controller
public class HomeFrontEndController {

    SanPhamDAO sp = null;
    HangDAO hsx = null;
    NguoiDungDAO nd = null;
    DonHangDAO dh = null;
    ChiTietDonHangDAO ctdh = null;

    public HomeFrontEndController() {
        sp = new SanPhamDAO();
        hsx = new HangDAO();
        nd = new NguoiDungDAO();
        dh = new DonHangDAO();
        ctdh = new ChiTietDonHangDAO();
    }

    //trang chu
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model, HttpServletRequest servlet, HttpSession session) {
        NguoiDung ng = null;
//        
        List<SanPham> list1 = sp.getAll();
        int page, numberPage = 6;
        int size = list1.size();
        int num = (size % 6 == 0 ? (size / 6) : (size / 6)) + 1;

        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start, end;
        start = (page - 1) * numberPage;
        end = Math.min(page * numberPage, size);

        List<SanPham> list = sp.getListByPage(list1, start, end);
//        request.setAttribute("c", list);
        request.setAttribute("page", page);
        request.setAttribute("num", num);

//        Cookie[] checkCoo = servlet.getCookies();
//        for (Cookie checkCoo1 : checkCoo) {
//            if (checkCoo1.getName().equals("email")) {
//                ng = nd.getNgByEmail(checkCoo1.getValue());
//            }
//        }
        model.addAttribute("c", list);
        model.addAttribute("hsx", hsx.getAll());
//        model.addAttribute("g" , sp.pcGiaRe(DonGia));
//        if (ng != null) {
//            session.setAttribute("anh", ng.getAvatar());
//
//        }
        return "FrontEnd/index";
    }

//    Lọc từ a - b
    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public String filter(Model model, @RequestParam(value = "filterPrice") String price) {
        String[] pr;
        price = price.replace("đ", "");
        pr = price.split("-");
        float min = Float.parseFloat(pr[0]);
        float max = Float.parseFloat(pr[1]);
        model.addAttribute("c", sp.searchByPrice(min, max));
        model.addAttribute("hsx", hsx.getAll());
        return "FrontEnd/index";
    }

//    tìm kiếm theo tên
    @RequestMapping(value = "/searchName", method = RequestMethod.POST)
    public String SearchName(HttpServletRequest request, @RequestParam("ten") String ten, @ModelAttribute SanPham sanPham, ModelMap model) {
        List<SanPham> lstsanPhams = sp.searchByName(ten);
        if (lstsanPhams == null) {
            return "FrontEnd/index";
        } else {
            model.addAttribute("c", lstsanPhams);
            model.addAttribute("hsx", hsx.getAll());
            return "FrontEnd/index";
        }
    }

//    tim kiếm theo danh mục hãng
    @RequestMapping(value = "/hangSX")
    public String searchId(@RequestParam("id") int searchId, Model model) {
        List<SanPham> listsp = sp.searchId(searchId);
        model.addAttribute("c", listsp);
        model.addAttribute("tag", searchId);
        model.addAttribute("hsx", hsx.getAll());
        return "FrontEnd/index";
    }

    //sap xép tang dan
    @RequestMapping(value = "/tangDan", method = RequestMethod.GET)
    public String tangDan(Model model, @ModelAttribute SanPham sanPham) {
        List<SanPham> listsp = sp.tangDan();
        model.addAttribute("c", listsp);
        model.addAttribute("hsx", hsx.getAll());

        return "FrontEnd/index";
    }

    //sap xép giảm dan
    @RequestMapping(value = "/giamDan", method = RequestMethod.GET)
    public String giamDan(Model model, @ModelAttribute SanPham sanPham) {
        List<SanPham> listsp = sp.giamDan();
        model.addAttribute("c", listsp);
        model.addAttribute("hsx", hsx.getAll());

        return "FrontEnd/index";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String Contact(Model model) {
        return "FrontEnd/Contact";
    }

    @RequestMapping(value = "/productdetails", method = RequestMethod.GET)
    public String ProductDetails(Model model, @RequestParam(value = "id") int id) {
        model.addAttribute("c", sp.getById(id));
        model.addAttribute("s", sp.getByIdChiTiet(id));
        return "FrontEnd/Productdetails";
    }

    @RequestMapping(value = "/cart")
    public String Cart(HttpServletRequest request, HttpServletResponse response, Model model) {
        Gson g = new Gson();
        List<CartCookie> ccs = new ArrayList<>();

        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("cart")) {
                ccs = g.fromJson(cooky.getValue(), new TypeToken<List<CartCookie>>() {
                }.getType());
            }
        }
        Cart cart = new Cart();
        try {
            SanPhamDAO spDao = new SanPhamDAO();

            for (CartCookie cc : ccs) {
                SanPham sp1 = spDao.getById(cc.getId());
                ItemSPCart t1 = new ItemSPCart(sp1, cc.getQuantity(), cc.getPrice());
                cart.addItem(t1);
            }
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
        model.addAttribute("cart", list);
        model.addAttribute("total", total);
        model.addAttribute("totalQuan", soluong);
        return "FrontEnd/Cart";
    }

    @RequestMapping(value = "/wishlist", method = RequestMethod.GET)
    public String wishlist(Model model, HttpSession session) {
        String email = (String) session.getAttribute("email");
        if (email == null) {
            return "FrontEnd/Login";
        } else {
            NguoiDung nguoiDung = nd.getNgByEmail(email);

            List<SanPham> sanPhams = new ArrayList<>();
            for (DonHang tietDonHang : nguoiDung.getDonHangCollection()) {
                for (ChiTietDonHang ctdh : tietDonHang.getChiTietDonHangCollection()) {
                    sanPhams.add(ctdh.getSanPham());
                }
            }
            model.addAttribute("sanPhams", sanPhams);
            return "FrontEnd/Wishlist";
        }
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(Model model, DonHang donHangs, HttpSession session1, HttpServletRequest request, HttpServletResponse response) {
//        String email = "thang@gmail.com";
        String email = (String) session1.getAttribute("email");
        if (email == null) {
            return "FrontEnd/Login";
        } else {
            NguoiDung nguoiDung = nd.getNgByEmail(email);
            model.addAttribute("nd", nguoiDung);

            Gson g = new Gson();
            List<CartCookie> ccs = new ArrayList<>();

            Cookie[] cookies = request.getCookies();
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("cart")) {
                    ccs = g.fromJson(cooky.getValue(), new TypeToken<List<CartCookie>>() {
                    }.getType());
                }
            }

            if (ccs == null || ccs.size() == 0) {
                model.addAttribute("ccs", "Bạn không có sản phẩm để thanh toán!!");
                return "FrontEnd/Cart";
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
            } catch (NumberFormatException e) {
            }

            List<ItemSPCart> list = cart.getItems();
            double total = 0;
            int totalQuan = 0;
            for (ItemSPCart item : list) {
                totalQuan += item.getQuantity();
                total += item.getPrice() * item.getQuantity();
            }
            model.addAttribute("cart", list);
            model.addAttribute("totalQuan", totalQuan);
            model.addAttribute("total", total);
//            dh.insert(donHangs);
            System.out.println(donHangs);

            return "FrontEnd/Checkout";

        }

    }

    @RequestMapping(value = "/setCheckout", method = RequestMethod.POST)
    public String setCheckout(Model model, DonHang donHangs, String diaChiKhac, HttpSession session1, HttpServletRequest request, HttpServletResponse response) {
//        String email = "thang@gmail.com";
        String email = (String) session1.getAttribute("email");
        System.out.println(email);
        if (email == null) {
            return "FrontEnd/Login";
        } else {
            NguoiDung nguoiDung = nd.getNgByEmail(email);

            Gson g = new Gson();
            List<CartCookie> ccs = null;

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
            } catch (NumberFormatException e) {
            }
            if (diaChiKhac != null || diaChiKhac != "") {
                donHangs.setDiaChiNhan(diaChiKhac);
            }
            if (diaChiKhac.equals("")) {
                donHangs.setDiaChiNhan(nguoiDung.getDiaChi());
            }
            donHangs.setMaNguoiDung(nguoiDung);
            dh.insert(donHangs);

            List<ItemSPCart> list = cart.getItems();
            List<ChiTietDonHang> chiTiets = new ArrayList<>();
            int _idDH = dh.getLatestDonHang();
            for (ItemSPCart item : list) {
                ChiTietDonHang chiTiet = new ChiTietDonHang();
                chiTiet.setDonGia(item.getSanPham().getDonGia());
                chiTiet.setSoLuong(item.getQuantity());
                chiTiet.setDonHang(donHangs);
                chiTiet.setSanPham(item.getSanPham());

//                System.out.println(item.getSanPham());
//                System.out.println(donHangs);
                chiTiet.setDonHang(donHangs);
                ChiTietDonHangPK chiTietPK = new ChiTietDonHangPK();
                chiTietPK.setMaDonHang(_idDH);
                chiTietPK.setMaSanPham(item.getSanPham().getId());
                chiTiet.setChiTietDonHangPK(chiTietPK);
                chiTiet.setStatus("1");
                chiTiets.add(chiTiet);
            }

            for (ChiTietDonHang chiTiet : chiTiets) {
                dh.insertChiTiet(chiTiet);
            }

            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("cart")) {
                    cooky.setMaxAge(0);
                    response.addCookie(cooky);
                }
            }
            model.addAttribute("nd", nguoiDung);
//            model.addAttribute("dh", donHangs);
//            model.addAttribute("ct", chiTiet);
//            model.addAttribute("total", total);

            return "FrontEnd/Order";

        }

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String Login(Model model) {
        return "FrontEnd/Login";
    }

    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public String loginController(@RequestParam("email") String email, @RequestParam("password") String password, NguoiDung nguoiDung, Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        List<NguoiDung> listnd = nd.checkLogin(email, password);
        if (listnd != null && listnd.size() > 0) {
//            Cookie co = new Cookie("email", email);
//            response.addCookie(co);
            session.setAttribute("email", email);

            session.setAttribute("password", password);
//            session.setAttribute("email", listnd);
            model.addAttribute("c", sp.getAll());
            model.addAttribute("hsx", hsx.getAll());
            nguoiDung = nd.getNgByEmail(email);
//            session.setAttribute("anh", nguoiDung.getAvatar());
            session.setAttribute("hoten", nguoiDung.getHoTen());
            return "FrontEnd/index";
        } else {
            model.addAttribute("msg", "Email hoặc mật khẩu của bạn không đúng !!!");
            return "FrontEnd/Login";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logOut(Model model, HttpSession session) {
        model.addAttribute("email", new NguoiDung());

        if (session.getAttribute("email") != null || session.getAttribute("anh") != null) {
            session.removeAttribute("email");
//            session.removeAttribute("anh");
            session.removeAttribute("hoten");
        }

        model.addAttribute("c", sp.getAll());
        model.addAttribute("hsx", hsx.getAll());
        return "FrontEnd/index";
    }

    @RequestMapping(value = "/dangKy", method = RequestMethod.POST)
    public String dangKi(HttpServletRequest request, Model model) {
        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diachi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String confirmPass = request.getParameter("confirmPass");
        if (confirmPass != pass) {
            if (!pass.equals(confirmPass)) {
                return "FrontEnd/Login";
            } else {
                // check xem da có email tt hay chưa
                boolean check = nd.checkEmail(email, sdt);
                if (!check) {
                    nd.insert(ten, diaChi, email, pass, sdt);
                    model.addAttribute("msg", "Đăng ký thành công !!");
                    return "FrontEnd/Login";
                }
                model.addAttribute("msg", "Đăng ký không thành công !!");
                return "FrontEnd/Login";
            }
        } else {
            model.addAttribute("msg", "Mật khẩu không khớp !!");
            return "FrontEnd/Login";
        }

    }

    @RequestMapping(value = "/profile")
    public String Profile(Model model, HttpSession session) {
        String email = (String) session.getAttribute("email");
        NguoiDung nguoiDung = nd.getNgByEmail(email);
        model.addAttribute("n", nguoiDung);
        return "FrontEnd/Profile";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String Update(Model model, NguoiDung c, HttpSession session, HttpServletRequest request) {
        String email = (String) session.getAttribute("email");
        String pass = request.getParameter("pass");
        NguoiDung nguoiDung = nd.getNgByEmail(email);
        if (!pass.equals(nguoiDung.getPassword())) {
            model.addAttribute("msg", " Mật khẩu không đúng 🙂");
            return "FrontEnd/Profile";
        } else {
            model.addAttribute("n", nguoiDung);
            return "FrontEnd/SupProfile";
        }

    }

    @RequestMapping(value = "/setupdate", method = RequestMethod.POST)
    public String SetUpdate(Model model, NguoiDung c, HttpSession session, HttpServletRequest request) {
        String email = (String) session.getAttribute("email");
//        NguoiDung nguoiDung = nd.getNgByEmail(email);
//        model.addAttribute("nd", nguoiDung);
        String passNew = request.getParameter("passNew");
        String confirmPassNew = request.getParameter("confirmPassNew");
        if (confirmPassNew != passNew) {
            if (!passNew.equals(confirmPassNew)) {
//                model.addAttribute("n", nguoiDung);
                model.addAttribute("msg", "Sửa không thành công !!");
                return "FrontEnd/SupProfile";
            } else {
                c.setPassword(passNew);
                nd.update(c);
//                nd.update(nguoiDung);
                model.addAttribute("msg", "Sửa thành công !!");
                return "FrontEnd/Profile";
            }
        } else {
            model.addAttribute("msg", "Mật khẩu không khớp !!");
            return "FrontEnd/SupProfile";
        }

    }

}
