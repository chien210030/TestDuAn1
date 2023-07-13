package com.example.du_an_1.controller;

import com.example.du_an_1.entity.NhanVien;
import com.example.du_an_1.repository.impl.NhanVienChucVuRepository;
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
import java.util.UUID;

@Controller
public class NhanVienChucVuController {
    @Autowired
    NhanVienChucVuRepository repository;

    @GetMapping("/nhan-vien-chuc-vu/hien-thi")
    public String hienThi(Model model, @RequestParam("p") Optional<Integer> p) {

        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<NhanVien> page = repository.findAll(pageable);
        model.addAttribute("NVCV", page);
        return "/NhanVienChucVu/index";
    }
    @GetMapping("/nhan-vien-chuc-vu/delete/{id}")
    public String delete(Model model,@PathVariable("id") Integer id){
        repository.deleteById(id);
        return "redirect:/nhan-vien-chuc-vu/hien-thi";
    }
}
