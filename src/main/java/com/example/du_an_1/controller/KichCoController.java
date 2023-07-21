package com.example.du_an_1.controller;


import com.example.du_an_1.entity.ChatLieu;
import com.example.du_an_1.entity.KichCo;
import com.example.du_an_1.repository.KichCoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
public class KichCoController {

    @Autowired
    private KichCoRepository kichCoRepository;

    @GetMapping("/loadkichco")
    public String sanpham(Model model,
                          @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "ten",required = false) String keyword
    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<KichCo> page =  kichCoRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("KichCo", page.getContent());


        return "ChiTietSP/DSKichCo";
    }
    @GetMapping("/viewaddKichCo")
    public String viewaddsanpham(){

        return "ChiTietSP/viewaddKichCo";
    }
    @PostMapping("/addKichCo")
    public String addchatlieu(Model model,@ModelAttribute KichCo kichCo) {
        KichCo t1 = kichCoRepository.save(kichCo);
        return "redirect:/loadkichco";
    }
    @GetMapping("/deleteKichCo/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        kichCoRepository.deleteById(id);
        return "redirect:/loadkichco";
    }
    @GetMapping("/updateKichCo/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("updateKichCo",kichCoRepository.findById(id).orElse(null));

        return "ChiTietSP/viewupdateKichCo";
    }



}
