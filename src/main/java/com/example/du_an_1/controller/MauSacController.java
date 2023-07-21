package com.example.du_an_1.controller;


import com.example.du_an_1.entity.MauSac;
import com.example.du_an_1.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;


@Controller
public class MauSacController {

    @Autowired
        private MauSacRepository mauSacRepository;

    @GetMapping("/loadMauSac")
    public String sanpham(Model model,
                          @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "ten",required = false) String keyword
    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<MauSac> page =  mauSacRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("MauSac", page.getContent());


        return "ChiTietSP/DSMauSac";
    }
    @GetMapping("/viewaddMauSac")
    public String viewaddsanpham(){

        return "ChiTietSP/viewaddMauSac";
    }
    @PostMapping("/addMauSac")
    public String addchatlieu(Model model,@ModelAttribute MauSac mauSac) {
        MauSac t1 = mauSacRepository.save(mauSac);
        return "redirect:/loadMauSac ";
    }
    @GetMapping("/deleteMauSac/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        mauSacRepository.deleteById(id);
        return "redirect:/loadMauSac";
    }
    @GetMapping("/updateMauSac/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("updateMauSac",mauSacRepository.findById(id).orElse(null));

        return "ChiTietSP/viewupdateMauSac";
    }

}
