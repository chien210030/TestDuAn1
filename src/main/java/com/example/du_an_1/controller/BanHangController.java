package com.example.du_an_1.controller;


import com.example.du_an_1.Service.impl.ChiTietSPServiceImpl;
import com.example.du_an_1.Service.impl.KhachHangServiceImpl;
import com.example.du_an_1.entity.ChiTietSP;
import com.example.du_an_1.entity.HoaDon;
import com.example.du_an_1.entity.HoaDonChiTiet;
import com.example.du_an_1.entity.KhachHang;
import com.example.du_an_1.entity.NhanCa;
import com.example.du_an_1.repository.ChiTietSPRepository;
import com.example.du_an_1.repository.DongSPRepository;
import com.example.du_an_1.repository.HoaDonChiTietRepository;
import com.example.du_an_1.repository.HoaDonRepository;
import com.example.du_an_1.repository.KhuyenMaiRepository;
import com.example.du_an_1.repository.KichCoRepository;
import com.example.du_an_1.repository.ThuongHieuRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

//    @Autowired
//    private NhanVienChucVuRepository nhanVienChucVuRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private ChiTietSPServiceImpl ctspService;

    @Autowired
    private KhachHangServiceImpl khservice;

    @ModelAttribute("loadchitietsp")
    public List<ChiTietSP> getallchitietsp(Model model,
                                           @RequestParam(name = "pageNumCT", required = false, defaultValue = "1") Integer pageNum) {
        Pageable pageable = PageRequest.of(pageNum - 1, 3);
        Page<ChiTietSP> pageCT = ctspService.getall(pageable);
        model.addAttribute("chitietPages", pageCT.getTotalPages());
        return pageCT.getContent();
    }


    @GetMapping("/banhang")
    public String hienThiHoaDon(Model model,
                                @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "ten", required = false) String keyword) {

        Sort sort = Sort.by(Sort.Direction.DESC, "ngaytao");
        Pageable pageable = PageRequest.of(pageNum - 1, 5, sort);
        Page<HoaDon> page = hoaDonRepository.findAll(pageable);

//        Pageable pageable1 = PageRequest.of(pageNum - 1,2) ;
//        Page<ChiTietSP> page4 = ctspService.getall(pageable1);

        model.addAttribute("totalPages", page.getTotalPages());
//        model.addAttribute("chitietPages", page4.getTotalPages());

        model.addAttribute("HoaDon", page.getContent());

        model.addAttribute("dongsp", dongSPRepository.findAll());
        model.addAttribute("kichco", kichCoRepository.findAll());
        model.addAttribute("thuonghieu", thuongHieuRepository.findAll());
//        model.addAttribute("nhanvien", nhanVienChucVuRepository.findAll());
        model.addAttribute("khuyenmai", khuyenMaiRepository.findAll());
//        model.addAttribute("dongsp",page1.getContent());

        return "BanHang/ManHinhBanHang";
    }


    @PostMapping("/taohoadon")
    @ResponseBody // This annotation indicates that the method returns JSON response
    public ResponseEntity<String> taohoadon(@RequestParam("ma") String ma, HttpSession session) {

        NhanCa nhanCa = (NhanCa) session.getAttribute("currentNhanCa");

        if (nhanCa == null) {
            // Return an error response
            return ResponseEntity.badRequest().body("Không thể tạo hóa đơn vì chưa nhận ca.");
        }

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa(ma);
        hoaDon.setNgaytao(new Date());
        hoaDon.setTrangthai(0);

        hoaDonRepository.save(hoaDon);

        // Return a success response
        return ResponseEntity.ok("Hóa đơn đã được tạo thành công.");
    }


    HoaDon hoadonngoai;
    List<HoaDonChiTiet> hdct;
    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;

    @GetMapping("/gethoadon/{id}")
    public String ReadHD(@PathVariable("id") UUID idhd, Model model) {

            hoadonngoai = hoaDonRepository.findById(idhd).orElse(null);
            System.out.println("hoa don" + hoadonngoai);

            hdct = hoadonngoai.getHoaDonChiTiets();
            System.out.println("HD CT NE" + hdct);
            BigDecimal tongtienhang = hdct
                    .stream().map(sp -> sp.getDongia())
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            hoadonngoai.setTongtien(tongtienhang);


            model.addAttribute("HoaDonTo", hoadonngoai);
            model.addAttribute("CTHoaDon", hdct);
            if (hoadonngoai == null) {
                return "redirect:/banhang-hoadon/banhang";
            }


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

            hdctt.setChiTietSP(ctsp1);
            hdctt.setHoadon(hd1);
            hoaDonChiTietRepository.save(hdctt);
            return "redirect:/banhang-hoadon/banhang";

        }
        return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();

    }

    @PostMapping("/updateSoLuong/{id}")
    public String GiamSoLuong(@PathVariable("id") UUID idhdct, @RequestParam("soluong") int soluongcapnhat, Model model) {
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
        } else if (soluongcapnhat > chiTietSP.getSoluongton()) {
            model.addAttribute("error", "so luong ban them vao vuot qua so luong hang hien co");
            return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();
        }

        System.out.println("chay ra ngoai " + chiTietSP.getSoluongton());

        return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();
    }

    @Transactional
    @PostMapping("/themkhachhang")
    public String ThemTTKhachHang(
            @RequestParam("ten") String ten,
            @RequestParam("tendem") String tendem,
            @RequestParam("sdt") String sdt
//            ,
//            @RequestParam("ngaysinh") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaysinh
    ) {
        KhachHang kh = new KhachHang();
        if (hoadonngoai != null && hoadonngoai.getKhachhang() == null) {
            kh.genmakh();
            kh.setTen(ten);
            kh.setTendem(tendem);
            kh.setSdt(sdt);
//                    kh.setNgaysinh(ngaysinh);
            khservice.add(kh);
            hoadonngoai.setKhachhang(kh);
            hoaDonRepository.save(hoadonngoai);
        } else if (hoadonngoai != null && hoadonngoai.getKhachhang() == null && sdt == null) {
            KhachHang kh1 = new KhachHang();
            kh1.genmakh();
            kh1.setTen(ten);
            kh1.setTendem(tendem);
//          kh.setNgaysinh(ngaysinh);
            khservice.add(kh1);
            hoadonngoai.setKhachhang(kh1);
            hoaDonRepository.save(hoadonngoai);

        }
        return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();
    }

    @PostMapping("/XoaSanPham/{idhdct}")
    public String RemoveSanPham(@PathVariable("idhdct") UUID idhdct) {
        HoaDonChiTiet hdctChon = hoaDonChiTietRepository.findById(idhdct).orElse(null);
        UUID idctsp = hdctChon.getChiTietSP().getId();
        ChiTietSP spct = chiTietSPRepository.findById(idctsp).orElse(null);
        spct.setSoluongton(spct.getSoluongton() + hdctChon.getSoluong());
        chiTietSPRepository.save(spct);
        hoadonngoai.setTongtien(null);
        hoaDonRepository.save(hoadonngoai);

        hoaDonChiTietRepository.delete(hdctChon);


        return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();
    }

    @PostMapping("/huydon")
    public String huydon() {
        try {
            if (hoadonngoai != null) {
                System.out.println("huy don ");

                if (hdct != null) {
                    for (HoaDonChiTiet hhdct : hdct) {
                        UUID idsp = hhdct.getChiTietSP().getId();
                        ChiTietSP ctsp = chiTietSPRepository.findById(idsp).orElse(null);
                        if (hhdct.getChiTietSP().getId().equals(ctsp.getId())) {
                            int soluongthemvao = ctsp.getSoluongton() + hhdct.getSoluong();
                            ctsp.setSoluongton(soluongthemvao);
                            hoaDonChiTietRepository.deleteById(hhdct.getId());
                        }
                    }
                }
                hoaDonRepository.delete(hoadonngoai);
                return "redirect:/banhang-hoadon/banhang";
            } else if (hoadonngoai == null) {
                return "redirect:/banhang-hoadon/banhang";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/banhang-hoadon/banhang";
    }

    @PostMapping("/thanhtoan")
    public String ThanhToan(Model model,
//                            @RequestParam("nhanvien") UUID idnhanvien,
                            @RequestParam("tienkhachhangtra") BigDecimal khachtra,
                            @RequestParam("tongtienkm") BigDecimal tongKM, HttpSession session
    ) {

        if (khachtra != null) {
            System.out.println("chay vao  if 1  ");
//            NhanVien nv = nhanVienChucVuRepository.findById(idnhanvien).orElse(null);
            BigDecimal tienhang = hdct
                    .stream().map(sp -> sp.getDongia())
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            hoadonngoai.setTongtien(tienhang);
            hoadonngoai.setTongtienkm(tongKM);
            // tru tien khuyen mai
            BigDecimal tongtienTT = tienhang.subtract(tongKM);
            hoadonngoai.setTongtientt(tongtienTT);

            if (khachtra.compareTo(tongtienTT) >= 0) {
                System.out.println("chay vao  if 2 ");
//                KhachHang newkh = new KhachHang();
//                newkh.setTen("khach");
                hoadonngoai.setNgaythanhtoan(new Date());
                hoadonngoai.setTrangthai(1);

//                hoadonngoai.setNhanVien(nv);

//Nhan Ca
                NhanCa nhanCa = (NhanCa) session.getAttribute("currentNhanCa");
                hoadonngoai.setNhanCa(nhanCa);

                hoadonngoai.setTienkhachhangtra(khachtra);
                hoaDonRepository.save(hoadonngoai);

            }
            model.addAttribute("inHoaDon", hoadonngoai);
//            return "BanHang/HoaDon";
        } else if (khachtra == null) {
            System.out.println(" loi controller");
            model.addAttribute("loiTienKhach", "chua co tien khach tra ");
        }
        return "redirect:/banhang-hoadon/gethoadon/" + hoadonngoai.getId().toString();
//        return "redirect:/BanHang/HoaDon";
    }

    @GetMapping("/ban-hang")
    public String testgiaodien() {

        return "BanHang/ManHinhBanHang";
    }


}
