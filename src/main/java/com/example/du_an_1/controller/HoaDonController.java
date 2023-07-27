package com.example.du_an_1.controller;

import com.example.du_an_1.entity.HoaDon;
import com.example.du_an_1.entity.KhachHang;
import com.example.du_an_1.entity.NhanVien;
import com.example.du_an_1.repository.HoaDonRepository;
import com.example.du_an_1.repository.KhachHangRepository;
import com.example.du_an_1.repository.impl.NhanVienChucVuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private NhanVienChucVuRepository nhanVienChucVuRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @GetMapping("/hien-thi")
    public String hienThiHoaDon(Model model,
                                @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum ,
                                @RequestParam(name = "ten", required = false) String keyword){

        Pageable pageable = PageRequest.of(pageNum-1, 5);
        Page<HoaDon> page = hoaDonRepository.findAll(pageable);

        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("HoaDon",page.getContent());
        return "HoaDon/hienthi";
    }

    @PostMapping("/clear")
    public String xoaToanBoHoaDon(){
        hoaDonRepository.deleteAll();
        return "redirect:/hoa-don/hien-thi";
    }

    @PostMapping("/xoa")
    public String xoaHoaDon(@RequestParam("id") UUID id){
        hoaDonRepository.deleteById(id);
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/tao-moi")
    public String hienThiFormTaoMoiHoaDon(Model model) {
        HoaDon hoaDon = new HoaDon();
        model.addAttribute("hoaDon", hoaDon);

        return "HoaDon/taomoi";
    }

    @PostMapping("/luu-tao-moi")
    public String luuTaoMoiHoaDon(@RequestParam("ma") String ma,
                                  @RequestParam("ngaytao") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaytao,
                                  @RequestParam("ngaythanhtoan") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaythanhtoan,
                                  @RequestParam("trangthai") int trangthai,
                                  @RequestParam("ghichu") String ghichu,
                                  @RequestParam("tongtien") BigDecimal tongtien,
                                  @RequestParam("tongtienkm") BigDecimal tongtienKM,
                                  @RequestParam("tongtientt") BigDecimal tongtienTT) {

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa(ma);
        hoaDon.setNgaytao(ngaytao);
        hoaDon.setNgaythanhtoan(ngaythanhtoan);
        hoaDon.setTrangthai(trangthai);
        hoaDon.setGhichu(ghichu);
        hoaDon.setTongtien(tongtien);
        hoaDon.setTongtienKM(tongtienKM);
        hoaDon.setTongtientt(tongtienTT);


        hoaDonRepository.save(hoaDon);

        return "redirect:/hoa-don/hien-thi";
    }
}
