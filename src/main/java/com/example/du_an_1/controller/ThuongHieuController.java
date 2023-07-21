package com.example.du_an_1.controller;

import com.example.du_an_1.entity.MauSac;
import com.example.du_an_1.entity.ThuongHieu;
import com.example.du_an_1.repository.MauSacRepository;
import com.example.du_an_1.repository.ThuongHieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
public class ThuongHieuController {

    @Autowired
    private ThuongHieuRepository thuongHieuRepository;



    @GetMapping("/loadThuongHieu")
    public String sanpham(Model model,
                          @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "ten",required = false) String keyword
    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<ThuongHieu> page =  thuongHieuRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("ThuongHieu", page.getContent());


        return "ChiTietSP/DSThuongHieu";
    }

    @GetMapping("/viewaddThuongHieu")
    public String viewaddsanpham(){

        return "ChiTietSP/viewaddThuongHieu";
    }
    @PostMapping("/addThuongHieu")
    public String addchatlieu(Model model,@ModelAttribute ThuongHieu thuongHieu) {
        ThuongHieu t1 = thuongHieuRepository.save(thuongHieu);
        return "redirect:/loadThuongHieu ";
    }
    @GetMapping("/deleteThuongHieu/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        thuongHieuRepository.deleteById(id);
        return "redirect:/loadThuongHieu";
    }
    @GetMapping("/updateThuongHieu/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("updateThuongHieu",thuongHieuRepository.findById(id).orElse(null));

        return "ChiTietSP/viewupdateThuongHieu";
    }

}
