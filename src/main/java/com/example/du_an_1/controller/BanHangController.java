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
import java.util.*;

@Controller
@SessionAttributes("loadchitietsp")
@RequestMapping("/banhang-hoadon")
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
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @ModelAttribute("loadchitietsp")
    public List<ChiTietSP> getallchitietsp() {

        return chiTietSPRepository.findAll();
    }


    @GetMapping("/banhang")
    public String hienThiHoaDon(Model model,
                                @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "ten", required = false) String keyword) {

        Pageable pageable = PageRequest.of(pageNum - 1, 5);
        Page<HoaDon> page = hoaDonRepository.findAll(pageable);

//        Page<DongSP> page1 = dongSPRepository.findAll(pageable);
//        Page<KichCo> page2 = kichCoRepository.findAll(pageable);
//        Page<ThuongHieu> page3 = thuongHieuRepository.findAll(pageable);

        Page<ChiTietSP> page4 = chiTietSPRepository.findAll(pageable);

        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("chitietPages", page4.getTotalPages());

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
                            @RequestParam("nhanvien") UUID idnhanvien
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

        return "redirect:/banhang-hoadon/banhang";
    }



    public boolean checkspthd(UUID idct) {
        return false;
    }

    @GetMapping("/gethoadon/{id}")
    public String ReadHD(@PathVariable("id") UUID idhd, Model model) {
        HoaDon cthoadon = hoaDonRepository.findById(idhd).orElse(null);

        List<HoaDonChiTiet> hdct = cthoadon.getHoaDonChiTiets();

        model.addAttribute("CTHoaDon", cthoadon);
        return "redirect:/banhang-hoadon/banhang";
    }

    @PostMapping("/add/{id}")
    public String addSanPhamvaoHDCT(@PathVariable("id") UUID idctsp, @RequestParam("soluong") int soluongthem) {
        ChiTietSP ctsp1 = chiTietSPRepository.findById(idctsp).orElse(null);

        System.out.println("id ct" + idctsp);

        System.out.println("so " + soluongthem);
        if (checkspthd(idctsp)) {
            //truong hop da co hoa don, và có idctsp phải check xem nó là hóa đơn chờ hay không(check cả xem ctsp đó có trong hdct hay ko)
            // rồi nếu có hóa đơn thì tăng lên 1 số lượng hoặc mk điều chỉnh số lượng tùy ý (hard)


        } else {
            // trường hợp chưa  có hoa don và chưa có idctsp, thì khi thêm sản phẩm(đồng thời tạo hd ) thì mặc định là thêm 1 sản phẩm vào hdct

            // tao hoa don
            HoaDon hd1 = new HoaDon();
            hd1.generateMa();
            hd1.setNgaytao(new Date());
            hd1.setTrangthai(0);
            hoaDonRepository.save(hd1);
            //tao hdct
            HoaDonChiTiet hdctt = new HoaDonChiTiet();

            if (ctsp1.getSoluongton() > 0 && soluongthem > 1) {
                int soluongtonmoi = ctsp1.getSoluongton() - soluongthem;
                ctsp1.setSoluongton(soluongtonmoi);

                BigDecimal dongiaTVaohdct = ctsp1.getGiaban().multiply(new BigDecimal(soluongthem));
                hdctt.setSoluong(soluongthem);
                hdctt.setDongia(dongiaTVaohdct);

            } else if (soluongthem == 1) {
                ctsp1.setSoluongton(ctsp1.getSoluongton() - 1);
                hdctt.setSoluong(1);
                hdctt.setDongia(ctsp1.getGiaban());
            }
            hdctt.setChiTietSP(ctsp1);


            hdctt.setHoadon(hd1);
            hoaDonChiTietRepository.save(hdctt);


        }


        return "redirect:/banhang-hoadon/banhang";
    }


    @GetMapping("/ban-hang")
    public String testgiaodien() {

        return "BanHang/ManHinhBanHang";
    }


}
