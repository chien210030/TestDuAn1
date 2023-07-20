package com.example.du_an_1.controller;


import com.example.du_an_1.Service.SanPhamService;
import com.example.du_an_1.entity.ChiTietSP;
import com.example.du_an_1.entity.SanPham;
import com.example.du_an_1.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller

public class SanPhamController {

 @Autowired
    private SanPhamRepository sanPhamRepository;

    @GetMapping("/san-pham")
    public String sanpham(Model model,
                                @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "ten",required = false) String keyword
    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<SanPham> page = (Page<SanPham>) sanPhamRepository.findAll();
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("SP", page.getContent());


        return "ChiTietSP/sanpham/viewsanpham";
    }



}
