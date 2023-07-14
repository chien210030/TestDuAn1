package com.example.du_an_1.controller;

import com.example.du_an_1.entity.KhachHang;
import com.example.du_an_1.entity.NhanVien;
import com.example.du_an_1.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class KhachHangController {

    @Autowired
    KhachHangRepository khachHangRepository;

    @GetMapping("/khach-hang/hien-thi")
    public String hienThi(Model model, @RequestParam("Trang") Optional<Integer> p) {

        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<KhachHang> page = khachHangRepository.findAll(pageable);
        model.addAttribute("khachHang", page);
        return "/KhachHang/index";
    }

    @GetMapping("/khach-hang/remove/{id}")
    public String remove(@PathVariable("id") Integer id){
        khachHangRepository.deleteById(id);
        return "redirect:/KhachHang/index";
    }

    @GetMapping("/khach-hang/view-update/{id}")
    public String viewUpdate(Model model,@PathVariable("id") Integer id){

        KhachHang kh = khachHangRepository.getReferenceById(id);
        model.addAttribute("update",kh);

        return "/KhachHang/viewUpdate";
    }

}
