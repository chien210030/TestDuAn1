package com.example.du_an_1.controller;


import com.example.du_an_1.entity.DongSP;
import com.example.du_an_1.entity.SanPham;
import com.example.du_an_1.repository.DongSPRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
public class DongSPController {


    @Autowired
   private DongSPRepository dongSPRepository;

    @GetMapping("/loadDongSP")
    public String sanpham(Model model,
                          @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "ten",required = false) String keyword
    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<DongSP> page =  dongSPRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("Dongsp", page.getContent());


        return "ChiTietSP/DSdongSP";
    }

    @GetMapping("/viewaddDongSP")
    public String viewaddsanpham(){

        return "ChiTietSP/viewaddDongSP";
    }
    @PostMapping("/addDongsp")
    public String addsp(Model model,@ModelAttribute DongSP dongSP) {
        DongSP t1 = dongSPRepository.save(dongSP);
        return "redirect:/loadDongSP";
    }
    @GetMapping("/deleteDongSP/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        dongSPRepository.deleteById(id);
        return "redirect:/loadDongSP";
    }
    @GetMapping("/updateDongSP/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("updateDongSP",dongSPRepository.findById(id).orElse(null));

        return "ChiTietSP/viewUpdateDongSP";
    }



}
