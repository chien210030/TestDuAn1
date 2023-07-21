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
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

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
        Page<SanPham> page =  sanPhamRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("SP", page.getContent());


        return "ChiTietSP/DSsanpham";
    }

   @GetMapping("/showaddsp")
    public String viewaddsanpham(){

        return "ChiTietSP/viewaddsanpham";
    }
    @PostMapping("/addsp")
  public String addsp(Model model,@ModelAttribute SanPham sanPham) {
        SanPham t1 = sanPhamRepository.save(sanPham);
        return "redirect:/san-pham";
  }

    @GetMapping("/deletesp/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        sanPhamRepository.deleteById(id);
        return "redirect:/san-pham";
    }
    @GetMapping("/viewupdateSP/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("updateSP",sanPhamRepository.findById(id).orElse(null));

        return "ChiTietSP/viewupdatesanpham";
    }







}
