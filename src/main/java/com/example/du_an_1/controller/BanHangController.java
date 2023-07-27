package com.example.du_an_1.controller;


import com.example.du_an_1.entity.HoaDon;
import com.example.du_an_1.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BanHangController {

    @Autowired
  private HoaDonRepository hoaDonRepository;

    @GetMapping("/banhang-hoadon")
    public String hienThiHoaDon(Model model,
                                @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum ,
                                @RequestParam(name = "ten", required = false) String keyword){

        Pageable pageable = PageRequest.of(pageNum-1, 5);
        Page<HoaDon> page = hoaDonRepository.findAll(pageable);

        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("HoaDon",page.getContent());
        return "BanHang/ManHinhBanHang";
    }
    @GetMapping("/ban-hang")
    public String testgiaodien(){


        return "BanHang/ManHinhBanHang";
    }
    public  String taohoadon(){

        return "";
    }




}
