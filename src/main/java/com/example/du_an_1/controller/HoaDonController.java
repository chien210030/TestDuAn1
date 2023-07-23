package com.example.du_an_1.controller;

import com.example.du_an_1.entity.HoaDon;
import com.example.du_an_1.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonRepository hoaDonRepository;

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
}
