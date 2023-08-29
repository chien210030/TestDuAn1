package com.example.du_an_1.controller;


import com.example.du_an_1.entity.*;
import com.example.du_an_1.repository.*;
import com.example.du_an_1.repository.impl.NhanVienChucVuRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
//@SessionAttributes("loadchitietsp")
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

    HoaDon hoadonngoai;
    List<HoaDonChiTiet> hdct;

    @GetMapping("/gethoadon/{id}")
    public String ReadHD(@PathVariable("id") UUID idhd, Model model) {
        hoadonngoai = hoaDonRepository.findById(idhd).orElse(null);
        System.out.println("hoa don" + hoadonngoai);

        hdct = hoadonngoai.getHoaDonChiTiets();
        System.out.println("HD CT NE" + hdct);
        BigDecimal tongtienhang = hdct
                .stream().map(sp -> BigDecimal.valueOf(sp.getSoluong()).multiply(sp.getDongia()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        hoadonngoai.setTongtien(tongtienhang);

        model.addAttribute("HoaDonTo", hoadonngoai);
        model.addAttribute("CTHoaDon", hdct);


        return "forward:/banhang-hoadon/banhang";
    }

    public String xoaSanPham() {

        return "forward:/banhang-hoadon/banhang";
    }


    @PostMapping("/add/{id}")
    public String addSanPhamvaoHDCT(@PathVariable("id") UUID idctsp) {
        ChiTietSP ctsp1 = chiTietSPRepository.findById(idctsp).orElse(null);
        System.out.println("id ct" + idctsp);
//        System.out.println("so " + soluongthem);

        if (hoadonngoai != null && hoadonngoai.getId() != null) {
            //truong hop da co hoa don, và có idctsp phải check xem nó là hóa đơn chờ hay không(check cả xem ctsp đó có trong hdct hay ko)
            // rồi nếu có hóa đơn thì tăng lên 1 số lượng hoặc mk điều chỉnh số lượng tùy ý (hard)
            // đã có hóa đơn chi tiết

            // 1 check xem idctsp co trong hdct nay chua
            System.out.println("hdct o them" + hdct);
//            System.out.println("id chi tiet " + ctsp1.getId());
            System.out.println("chi tiet san pham" + ctsp1);
            int check = 0;
            for (HoaDonChiTiet xhdct : hdct) {

                System.out.println("id cua hdct khi chưa trong dk IF" + xhdct.getId());

                if (xhdct.getChiTietSP().getId().equals(ctsp1.getId())) {
                    // check trung id thi them so luong vao
                    System.out.println(("b2"));
                    System.out.println("hdct trong if" + xhdct);
                    //so luong mặc định là 1 khi thêm vào
                    int soluongOfHDCTcongthem = xhdct.getSoluong() + 1;
                    System.out.println("so hdct" + xhdct.getSoluong());
//                    System.out.println("so them " + soluongthem);
                    xhdct.setSoluong(soluongOfHDCTcongthem);

                    // don gia hdct
                    BigDecimal giatienOfHDCTkhicongThem = ctsp1.getGiaban().multiply(new BigDecimal(1));// ctsp1.getGiaBan() * soluongthem
                    BigDecimal giatienHDCT = xhdct.getDongia();
                    BigDecimal dongiamoi = giatienHDCT.add(giatienOfHDCTkhicongThem);
                    xhdct.setDongia(dongiamoi);

                    int soluongUpadteOfSanPham = ctsp1.getSoluongton() - 1;
                    ctsp1.setSoluongton(soluongUpadteOfSanPham);
                    chiTietSPRepository.save(ctsp1);
                    System.out.println("so luong cua SanPham sau khi cap nhat " + ctsp1.getSoluongton());
                    hoaDonChiTietRepository.save(xhdct);
                    System.out.println("so luong cua HDCt sau khi cap nhat" + xhdct.getSoluong());
                    check = 1;

                }
            }
            if (check == 0) {
                // chưa có ctsp trong hdct thì tạo mới hdct và dã có HoaDon
                System.out.println(" else if chay vao");
                System.out.println("hdct khi chua them moi" + hdct);

                HoaDonChiTiet newhdct = new HoaDonChiTiet();
                newhdct.setChiTietSP(ctsp1);
                newhdct.setSoluong(1);

//                BigDecimal dongiaOFCTSPMoi = ctsp1.getGiaban().multiply(new BigDecimal(1));
                newhdct.setDongia(ctsp1.getGiaban());
                newhdct.setHoadon(hoadonngoai);

                System.out.println("hdct mới mà ta thêm vào" + newhdct);

                hoaDonChiTietRepository.save(newhdct);
//                int soluongtonofctsp = ctsp1.getSoluongton() - 1;
                ctsp1.setSoluongton(ctsp1.getSoluongton() - 1);
                chiTietSPRepository.save(ctsp1);

                // ket luan : ở TH1: xhdct vẫn chưa xuất hiện của newhdct mà ta Save ở trên(nghĩa là chưa có trong for ,
                // mặc dù đã lưu vào trong db

//                System.out.println("hdct sau khi them id moi " + xhdct.getId());
            }
            System.out.println("hoa don  to " + hoadonngoai.getMa());


        } else if (hoadonngoai == null) {
            // trường hợp chưa  có hoa don và chưa có idctsp, thì khi thêm sản phẩm(đồng thời tạo hd ) thì
            // mặc định là thêm 1 sản phẩm vào hdct

            // tao hoa don
            HoaDon hd1 = new HoaDon();
            hd1.generateMa();
            hd1.setNgaytao(new Date());
            hd1.setTrangthai(0);
//            hd1.setNhanVien(new NhanVien());
            hoaDonRepository.save(hd1);
            //tao hdct
            HoaDonChiTiet hdctt = new HoaDonChiTiet();

            if (ctsp1.getSoluongton() > 0) {
                int soluongtonmoi = ctsp1.getSoluongton() - 1;
                ctsp1.setSoluongton(soluongtonmoi);

                BigDecimal dongiaTVaohdct = ctsp1.getGiaban().multiply(new BigDecimal(1));
                hdctt.setSoluong(1);
                hdctt.setDongia(dongiaTVaohdct);

            }
//            else if (soluongthem == 1) {
//                ctsp1.setSoluongton(ctsp1.getSoluongton() - 1);
//                hdctt.setSoluong(1);
//                hdctt.setDongia(ctsp1.getGiaban());
//            }
            hdctt.setChiTietSP(ctsp1);
            hdctt.setHoadon(hd1);
            hoaDonChiTietRepository.save(hdctt);


        }
        return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();
    }

    @PostMapping("/updateSoLuong/{id}")
    public String GiamSoLuong(@PathVariable("id") UUID idhdct, @RequestParam("soluong") int soluongcapnhat) {
        HoaDonChiTiet hdchitiet = hoaDonChiTietRepository.findById(idhdct).orElse(null);
        System.out.println("id hdcr" + idhdct);

        UUID idCTSP = hdchitiet.getChiTietSP().getId();
        ChiTietSP chiTietSP = chiTietSPRepository.findById(idCTSP).orElse(null);
        System.out.println("ct sp " + chiTietSP);
        System.out.println("so luong cap nhat " + soluongcapnhat);
        BigDecimal giatienmoi;
        System.out.println("so luong hdct hien tai " + hdchitiet.getSoluong());
        if (hdchitiet.getSoluong() > soluongcapnhat && soluongcapnhat < chiTietSP.getSoluongton()) {
            System.out.println("so cap nhat nho hon:" + soluongcapnhat);
            int soluongcongvao = hdchitiet.getSoluong() - soluongcapnhat;
            System.out.println("so luong cong vao :" + soluongcongvao);
            int soluongtonmoi1 = chiTietSP.getSoluongton() + soluongcongvao;
            System.out.println("so luong ton moi1 :" + soluongtonmoi1);
            chiTietSP.setSoluongton(soluongtonmoi1);
            chiTietSPRepository.save(chiTietSP);


            hdchitiet.setSoluong(soluongcapnhat);
            giatienmoi = chiTietSP.getGiaban().multiply(new BigDecimal(soluongcapnhat));
            hdchitiet.setDongia(giatienmoi);
            hoaDonChiTietRepository.save(hdchitiet);

            System.out.println("so luong ton moi  trong IF 1:" + soluongtonmoi1);


            System.out.println("so luong ton sau khi sava IN IF 1 " + chiTietSP.getSoluongton());
        } else if (hdchitiet.getSoluong() < soluongcapnhat && soluongcapnhat < chiTietSP.getSoluongton()) {
            System.out.println("so cap nhat lon hon" + soluongcapnhat);
            // so luong ctsp

            int soluongcongvao = soluongcapnhat - hdchitiet.getSoluong();
            int soluongtonmoi2 = chiTietSP.getSoluongton() - soluongcongvao;
            System.out.println("so luong ton moi  trong IF 2:" + soluongtonmoi2);
            chiTietSP.setSoluongton(soluongtonmoi2);
            chiTietSPRepository.save(chiTietSP);

            hdchitiet.setSoluong(soluongcapnhat);
            giatienmoi = chiTietSP.getGiaban().multiply(new BigDecimal(soluongcapnhat));
            hdchitiet.setDongia(giatienmoi);
            hoaDonChiTietRepository.save(hdchitiet);
            System.out.println("so luong ton sau khi save in IF 2 " + chiTietSP.getSoluongton());
        }

        System.out.println("chay ra ngoai " + chiTietSP.getSoluongton());
//                chiTietSPRepository.save(chiTietSP);
//        loadlai();
        return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();
    }

    public String ThanhToan() {

        return "";
    }

    @GetMapping("/ban-hang")
    public String testgiaodien() {

        return "BanHang/ManHinhBanHang";
    }


}
