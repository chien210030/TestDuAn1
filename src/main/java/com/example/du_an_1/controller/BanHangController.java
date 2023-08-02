package com.example.du_an_1.controller;


import com.example.du_an_1.entity.*;
import com.example.du_an_1.repository.*;
import com.example.du_an_1.repository.impl.NhanVienChucVuRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    @Autowired
    private NhanVienChucVuRepository nhanVienChucVuRepository;

    @ModelAttribute("loadchitietsp")
    public List<ChiTietSP> getallchitietsp() {

        return chiTietSPRepository.findAll();
    }

    @RequestMapping ("/banhang-hoadon")
    public String hienThiHoaDon(Model model,
                                @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "ten", required = false) String keyword) {

        Pageable pageable = PageRequest.of(pageNum - 1, 5);
        Page<HoaDon> page = hoaDonRepository.findAll(pageable);

        Page<DongSP> page1 = dongSPRepository.findAll(pageable);
        Page<KichCo> page2 = kichCoRepository.findAll(pageable);
        Page<ThuongHieu> page3 = thuongHieuRepository.findAll(pageable);

        Page<ChiTietSP> page4 = chiTietSPRepository.findAll(pageable);

        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("chitietPages",page4.getTotalPages());

        model.addAttribute("HoaDon", page.getContent());

        model.addAttribute("dongsp", dongSPRepository.findAll());
        model.addAttribute("kichco", kichCoRepository.findAll());
        model.addAttribute("thuonghieu", thuongHieuRepository.findAll());
        model.addAttribute("nhanvien", nhanVienChucVuRepository.findAll());
//        model.addAttribute("dongsp",page1.getContent());

        return "BanHang/ManHinhBanHang";
    }


    @PostMapping("/taohoadon")
    public String taohoadon(@RequestParam("ma") String ma,
                            @RequestParam("ngaytao") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaytao,
//                            @RequestParam("ngaythanhtoan") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaythanhtoan,
                            @RequestParam("nhanvien") UUID idnhanvien,
                            @RequestParam("trangthai") int trangthai
    ) {

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa(ma);
        hoaDon.setNgaytao(new Date());
        hoaDon.setTrangthai(0);
        NhanVien nhanVien = nhanVienChucVuRepository.findById(idnhanvien).orElse(null);
        if (nhanVien != null) {
            hoaDon.setNhanVien(nhanVien);


        }
        hoaDonRepository.save(hoaDon);
        return "redirect:/banhang-hoadon";
    }


    @GetMapping("/ban-hang")
    public String testgiaodien() {

        return "BanHang/ManHinhBanHang";
    }


}
