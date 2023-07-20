package com.example.du_an_1.controller;

import com.example.du_an_1.entity.KhachHang;
import com.example.du_an_1.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
public class KhachHangController {

    @Autowired
    KhachHangRepository khachHangRepository;

    @GetMapping("/khach-hang/hien-thi")
    public String hienThi(Model model, @RequestParam("trang") Optional<Integer> p) {

        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<KhachHang> page = khachHangRepository.findAll(pageable);
        model.addAttribute("khachHang", page);
        return "/KhachHang/index";
    }
    @GetMapping("/khach-hang/search")
    public String timTheoMaVaTen(Model model,String ma,String ten) {

        Pageable pageable = PageRequest.of(0, 5);
        Page<KhachHang> page = khachHangRepository.findAll(pageable);
        if(ma.length()>0&&ten.length()>0){
           page = khachHangRepository.findKhachHangByMaEqualsAndTenEquals(ma,ten,pageable);
            model.addAttribute("khachHang", page);
            return "/KhachHang/index";
        }
        if(ma.length()>0){
            page = khachHangRepository.findKhachHangByMaEquals(ma,pageable);
        }
        if(ten.length()>0){
            page = khachHangRepository.findKhachHangByTenEquals(ten,pageable);
        }
        System.out.println(ten);
        System.out.println(ma);
        model.addAttribute("khachHang", page);
        return "/KhachHang/index";
    }
    @GetMapping("/khach-hang/remove/{id}")
    public String remove(@PathVariable("id") Integer id){
        khachHangRepository.deleteById(id);
        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("/khach-hang/view-update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") Integer id){

        KhachHang khachHang = khachHangRepository.findById(Integer.valueOf(id)).orElse(null);
        model.addAttribute("update", khachHang);

        return "/KhachHang/viewUpdate";
    }

    @GetMapping("/khach-hang/detail/{id}")
    public String detail(Model model, @PathVariable("id") Integer id){

        KhachHang khachHang = khachHangRepository.findById(Integer.valueOf(id)).orElse(null);
        model.addAttribute("dt", khachHang);

        return "/KhachHang/detailKH";
    }


    @PostMapping("/khach-hang/update")
    public String update(Model model,
                         @RequestParam("id") Integer id,
                         @RequestParam("ho") String ho,
                         @RequestParam("tendem") String tendem,
                         @RequestParam("ten") String ten,
                         @RequestParam("gioitinh") Boolean gioitinh,
                         @RequestParam("ngaysinh") Date ngaysinh,
                         @RequestParam("email") String email,
                         @RequestParam("sdt") String sdt,
                         @RequestParam("diemthuong") Integer diemthuong
    ){


        KhachHang khachHang = khachHangRepository.findById(Integer.valueOf(id)).orElse(null);

        khachHang.setHo(ho);
        khachHang.setTendem(tendem);
        khachHang.setTen(ten);
        khachHang.setGioitinh(gioitinh);
        khachHang.setNgaysinh(ngaysinh);
        khachHang.setEmail(email);
        khachHang.setSdt(sdt);
        khachHang.setDiemthuong(diemthuong);

        khachHangRepository.save(khachHang);

        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("/khach-hang/view-add")
    public String viewAdd(Model model, @Validated @ModelAttribute("kh") KhachHang kh , BindingResult result){
        model.addAttribute("kh",new KhachHang());
        return "/KhachHang/ViewAdd";
    }



    @PostMapping("/khach-hang/add")
    public String add(Model model, @Validated @ModelAttribute("kh") KhachHang kh, BindingResult result){

//            if (result.hasErrors()){
//                return "/KhachHang/ViewAdd";
//            }

        khachHangRepository.save(kh);
        return "redirect:/khach-hang/hien-thi";
    }


    @ModelAttribute("gioitinh")
    public Map<Boolean, String> getGenders() {
        Map<Boolean, String> map = new HashMap<>();
        map.put(true, "Nam");
        map.put(false, "Nữ");
        return map;
    }

}
