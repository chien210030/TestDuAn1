package com.example.du_an_1.controller;

import com.example.du_an_1.entity.NSX;
import com.example.du_an_1.entity.ThuongHieu;
import com.example.du_an_1.repository.NSXRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
public class NSXController {

    @Autowired
    private NSXRepository nsxRepository;

    @GetMapping("/loadNSX")
    public String sanpham(Model model,
                          @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "ten",required = false) String keyword
    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<NSX> page =  nsxRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("NSX", page.getContent());


        return "ChiTietSP/DSNSX";
    }
    @GetMapping("/viewaddNSX")
    public String viewaddsanpham(){

        return "ChiTietSP/viewaddNSX";
    }
    @PostMapping("/addNSX")
    public String addchatlieu(Model model,@ModelAttribute NSX nsx) {
        NSX t1 = nsxRepository.save(nsx);
        return "redirect:/loadNSX ";
    }
    @GetMapping("/deleteNSX/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        nsxRepository.deleteById(id);
        return "redirect:/loadNSX";
    }
    @GetMapping("/updateNSX/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("updateNSX",nsxRepository.findById(id).orElse(null));

        return "ChiTietSP/viewupdateNSX";
    }


}
