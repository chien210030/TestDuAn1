package com.example.du_an_1.controller;


import com.example.du_an_1.entity.*;
import com.example.du_an_1.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("loadchitietsp")
public class BanHangController {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private ChiTietSPRepository chiTietSPRepository;

    @Autowired
    private DongSPRepository dongSPRepository;

    @Autowired
    private ThuongHieuRepository thuongHieuRepository;

    @Autowired
    private KichCoRepository kichCoRepository;

    @ModelAttribute("loadchitietsp")
    public  List<ChiTietSP> getallchitietsp(){

        return chiTietSPRepository.findAll();
    }

    @GetMapping("/banhang-hoadon")
    public String hienThiHoaDon(Model model,
                                @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "ten", required = false) String keyword) {

        Pageable pageable = PageRequest.of(pageNum - 1, 5);
        Page<HoaDon> page = hoaDonRepository.findAll(pageable);

        Page<DongSP> page1 = dongSPRepository.findAll(pageable);
        Page<KichCo> page2 = kichCoRepository.findAll(pageable);
        Page<ThuongHieu> page3 = thuongHieuRepository.findAll(pageable);

        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("HoaDon", page.getContent());

        model.addAttribute("dongsp", dongSPRepository.findAll());
        model.addAttribute("kichco", kichCoRepository.findAll());
        model.addAttribute("thuonghieu", thuongHieuRepository.findAll());

//        model.addAttribute("dongsp",page1.getContent());

        return "BanHang/ManHinhBanHang";
    }

    @GetMapping("/ban-hang")
    public String testgiaodien() {


        return "BanHang/ManHinhBanHang";
    }
        @PostMapping("")
    public String taohoadon() {

        return "";
    }


}
