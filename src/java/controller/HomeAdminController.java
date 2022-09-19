/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ThongKeDAO;
import entity.ChiTietDonHang;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author HOANG LAN COMPUTER
 */
@Controller
@RequestMapping(value="Admin")
public class HomeAdminController {
    ThongKeDAO tkdao ;

    public HomeAdminController() {
        tkdao=new ThongKeDAO();
    }
    
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String home(Model model) throws ParseException{
        int donhoanthanh = tkdao.countDonSuccess();
        int donhuy = tkdao.countDonHuy1();
        int tongdon = tkdao.countDonHuy();
        
        float tile = ( (float)donhoanthanh/((float)tongdon))*100;
        DecimalFormat df = new DecimalFormat("#.##");
        model.addAttribute("tile", df.format(tile));
        
        model.addAttribute("donhoanthanh", donhoanthanh);
        
        model.addAttribute("donhuy", donhuy);
        
        double total =0;
        List<Double> list = tkdao.DoanhThu();
        for (int i = 0; i < list.size(); i++) {
           total += list.get(i);
            
        }
        model.addAttribute("total", total);
        
        
        
        
        
        //Doanh thu theo thang --------------
        double T1 =0;
        List<Double> listT1 = tkdao.DoanhThuT1();
        T1 = listT1.stream().map((t1) -> t1).reduce(T1, (accumulator, _item) -> accumulator + _item);
        model.addAttribute("T1", T1);
        
        double T2 =0;
        List<Double> listT2 = tkdao.DoanhThuT2();
        for(Double t2 : listT1){
            T2 += t2;
        }
        model.addAttribute("T2", T2);
        
        double T3 =0;
        List<Double> listT3 = tkdao.DoanhThuT3();
        for(Double t3 : listT3){
            T3 += t3;
        }
        model.addAttribute("T3", T3);
        
        double T4 =0;
        List<Double> listT4 = tkdao.DoanhThuT4();
        for(Double t4 : listT4){
            T4 += t4;
        }
        model.addAttribute("T4", T4);
        
        double T5 =0;
        List<Double> listT5 = tkdao.DoanhThuT5();
        for(Double t5 : listT5){
            T5 += t5;
        }
        model.addAttribute("T5", T5);
        
        double T6 =0;
        List<Double> listT6 = tkdao.DoanhThuT6();
        for(Double t6 : listT6){
            T6 += t6;
        }
        model.addAttribute("T6", T6);
        
        double T7 =0;
        List<Double> listT7 = tkdao.DoanhThuT7();
        for(Double t7 : listT7){
            T7 += t7;
        }
        model.addAttribute("T7", T7);
        
        double T8 =0;
        List<Double> listT8 = tkdao.DoanhThuT8();
        for(Double t8 : listT8){
            T8 += t8;
        }
        model.addAttribute("T8", T8);
        
        double T9 =0;
        List<Double> listT9 = tkdao.DoanhThuT9();
        for(Double t9 : listT9){
            T9 += t9;
        }
        model.addAttribute("T9", T9);
        
        double T10 =0;
        List<Double> listT10 = tkdao.DoanhThuT10();
        for(Double t10 : listT10){
            T10 += t10;
        }
        model.addAttribute("T10", T10);
        
        double T11 =0;
        List<Double> listT11 = tkdao.DoanhThuT11();
        for(Double t11 : listT11){
            T11 += t11;
        }
        model.addAttribute("T11", T11);
        
        double T12 =0;
        List<Double> listT12 = tkdao.DoanhThuT12();
        for(Double t12 : listT12){
            T3 += t12;
        }
        model.addAttribute("T12", T12);
        
        
        //doanh thu theo thang
        
//        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//            
//            //Thang1
//            Date date1 = sdf.parse("2022-01-01");
//             Date date2 = sdf.parse("2022-01-31");
//             
//             //Thang2
//            Date date3 =  sdf.parse("2022-02-01");
//            Date date4 = sdf.parse("2022-02-29");
//            
//            //Thang3
//            Date date5 =  sdf.parse("2022-03-01");
//            Date date6 = sdf.parse("2022-03-31");
//            
//            //Thang4
//            Date date7 =  sdf.parse("2022-04-01");
//            Date date8 = sdf.parse("2022-04-30");
//            
//            //Thang5
//            Date date9 =  sdf.parse("2022-05-01");
//            Date date10 = sdf.parse("2022-05-31");
//            
//            //Thang6
//            Date date11 =  sdf.parse("2022-06-01");
//            Date date12 = sdf.parse("2022-06-30");
//            
//            //Thang7
//            Date date13 =  sdf.parse("2022-07-01");
//            Date date14 = sdf.parse("2022-07-31");
//            
//            //Thang8
//            Date date15 =  sdf.parse("2022-08-01");
//            Date date16 = sdf.parse("2022-08-31");
//            
//            //Thang9
//            Date date17 =  sdf.parse("2022-09-01");
//            Date date18 = sdf.parse("2022-039-30");
//            
//            //Thang10
//            Date date19 =  sdf.parse("2022-10-01");
//            Date date20 = sdf.parse("2022-10-31");
//            
//            //Thang11
//            Date date21 =  sdf.parse("2022-11-01");
//            Date date22 = sdf.parse("2022-11-30");
//            
//            //Thang12
//            Date date23 =  sdf.parse("2022-12-01");
//            Date date24 = sdf.parse("2022-12-31");
//        List<ChiTietDonHang> listct = tkdao.DoanhThuTheoThang();
//        
//        for (ChiTietDonHang ct : listct){
//            
//            if (ct.getNgayTao().after(date24)) {
////                total += ct.getDonGia();
//                System.out.println("Okkkkkkkkkkkkk");
//                
//            }else if (ct.getNgayTao().after(date3) && ct.getNgayTao().before(date4)) {
//                total += ct.getDonGia();
//            }
//            else if (ct.getNgayTao().after(date5) && ct.getNgayTao().before(date6)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date7) && ct.getNgayTao().before(date8)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date9) && ct.getNgayTao().before(date10)) {
//                total += ct.getDonGia();
//            }
//            else if (ct.getNgayTao().after(date11) && ct.getNgayTao().before(date12)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date13) && ct.getNgayTao().before(date14)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date15) && ct.getNgayTao().before(date16)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date17) && ct.getNgayTao().before(date18)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date19) && ct.getNgayTao().before(date20)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date21) && ct.getNgayTao().before(date22)) {
//                total += ct.getDonGia();
//            }else if (ct.getNgayTao().after(date23) && ct.getNgayTao().before(date24)) {
//                total += ct.getDonGia();
//            }
//        }
       
        return "Admin/home";
    }
    
}
