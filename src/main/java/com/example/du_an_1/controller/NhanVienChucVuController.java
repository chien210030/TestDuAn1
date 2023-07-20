package com.example.du_an_1.controller;

import com.example.du_an_1.entity.ChucVu;
import com.example.du_an_1.entity.NhanVien;
import com.example.du_an_1.repository.impl.ChucVuRepository;
import com.example.du_an_1.repository.impl.NhanVienChucVuRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
public class NhanVienChucVuController {
    @Autowired
    NhanVienChucVuRepository repository;

    @Autowired
    ChucVuRepository chucVuRepository;

    @GetMapping("/nhan-vien-chuc-vu/hien-thi")
    public String hienThi(Model model, @RequestParam("p") Optional<Integer> p) {

        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<NhanVien> page = repository.findAll(pageable);
        model.addAttribute("NVCV", page);
        return "/NhanVienChucVu/index";
    }
    @GetMapping("/nhan-vien-chuc-vu/delete/{id}")
    public String delete(Model model,@PathVariable("id") UUID id){
        repository.deleteById(id);
        return "redirect:/nhan-vien-chuc-vu/hien-thi";
    }
    @GetMapping("/nhan-vien-chuc-vu/view-add")
    public String viewAdd(Model model){
        model.addAttribute("chucVu",chucVuRepository.findAll());
        return "/NhanVienChucVu/Add";
    }
    @PostMapping("/nhan-vien-chuc-vu/add")
    public String add(Model model ,
                      @RequestParam("ma") String ma,
                      @RequestParam("ten") String ten,
                      @RequestParam("chucVu") String chucvu,
                      @RequestParam("ngaysinh") LocalDate ngaysinh,
                      @RequestParam("sdt") String sdt,
                      @RequestParam("taikhoan") String taikhoan,
                      @RequestParam("matkhau") String matkhau,
                      @RequestParam("email") String email,
                      @RequestParam("trangthai") String trangthai,
                      @RequestParam("gioitinh") String gioitinh

    ){
      //  ChucVu chucVu =  chucVuRepository.getReferenceById(Integer.valueOf(chucvu));
        ChucVu cv = chucVuRepository.findById(UUID.fromString(chucvu)).orElse(null);
        NhanVien nhanVien = NhanVien.builder()
                .id(UUID.randomUUID())
                .ten(ten)
                .ma(ma)
                .chucVu(cv)
                .ngaysinh(ngaysinh)
                .sdt(sdt)
                .taikhoan(taikhoan)
                .matkhau(matkhau)
                .email(email)
                .trangthai(Integer.valueOf(trangthai))
                .gioitinh(Integer.valueOf(gioitinh))
                .build();
        repository.save(nhanVien);
        return "redirect:/nhan-vien-chuc-vu/hien-thi";
    }
    @GetMapping("/nhan-vien-chuc-vu/detail/{id}")
    public String detail(@PathVariable("id") String id, Model model){
        model.addAttribute("nhanVien", repository.findById(UUID.fromString(id)).orElse(null));
        return "/NhanVienChucVu/Detail";
       // return "/NhanVienChucVu/Add";
    }

    @GetMapping("/nhan-vien-chuc-vu/view-update/{id}")
    public String viewUpdate(@PathVariable("id") String id, Model model){
        model.addAttribute("update",repository.findById(UUID.fromString(id)).orElse(null));
        model.addAttribute("chucVu",chucVuRepository.findAll());
        return "/NhanVienChucVu/Update";
    }
    @PostMapping("/nhan-vien-chuc-vu/update")
    public String update(Model model,
                         @RequestParam("id") String id,
                         @RequestParam("ma") String ma,
                         @RequestParam("ten") String ten,
                         @RequestParam("ngaysinh") LocalDate ngaysinh,
                         @RequestParam("chucVu") String chucVu,
                         @RequestParam("sdt") String sdt,
                         @RequestParam("taikhoan") String taikhoan,
                         @RequestParam("matkhau") String matkhau,
                         @RequestParam("email") String email,
                         @RequestParam("trangthai") String trangthai,
                         @RequestParam("gioitinh") String gioitinh){
        ChucVu chucvu = chucVuRepository.findById(UUID.fromString(chucVu)).get();
        NhanVien nhanVien = repository.findById(UUID.fromString(id)).get();
        NhanVien nv = NhanVien.builder()
                .ten(ten)
                .ma(ma)
                .chucVu(chucvu)
                .ngaysinh(ngaysinh)
                .sdt(sdt)
                .taikhoan(taikhoan)
                .matkhau(matkhau)
                .email(email)
                .trangthai(Integer.valueOf(trangthai))
                .gioitinh(Integer.valueOf(gioitinh))
                .build();
        nv.setId(UUID.fromString(id));
        BeanUtils.copyProperties(nv,nhanVien);
        repository.save(nv);
        return "redirect:/nhan-vien-chuc-vu/hien-thi";
    }
}
