package com.example.du_an_1.controller;

import com.example.du_an_1.entity.ChiTietSP;
import com.example.du_an_1.repository.ChiTietSPRepository;
import com.example.du_an_1.repository.DongSPRepository;
import com.example.du_an_1.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ChiTietSPController {

    @Autowired
    private ChiTietSPRepository chiTietSPRepository;
    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private DongSPRepository dongSPRepository;





    @GetMapping("/loadsp")
    public String loadChiTietSP(Model model) {
        model.addAttribute("loadSP", chiTietSPRepository.findAll());


        return "ChiTietSP/ChiTietSPView";
    }

    @GetMapping("/showcreate")
    public String ShowCreate(Model model) {
        model.addAttribute("sanPhams", sanPhamRepository.findAll());
        model.addAttribute("dongsanPhams", dongSPRepository.findAll());
//        model.addAttribute("sanPhams", sanPhamRepository.findAll());
//        model.addAttribute("sanPhams", sanPhamRepository.findAll());
//        model.addAttribute("sanPhams", sanPhamRepository.findAll());
//        model.addAttribute("sanPhams", sanPhamRepository.findAll());
//        model.addAttribute("sanPhams", sanPhamRepository.findAll());

//        sanPhamRepository.findAll().forEach(System.out::println);
        return "ChiTietSP/CreateView";
    }
    @PostMapping("/add")
    public String addsp(Model model, @ModelAttribute ChiTietSP chiTietSP){
   ChiTietSP t1 = chiTietSPRepository.save(chiTietSP);
        return "";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") Integer id) {
        chiTietSPRepository.deleteById(id);
        return "redirect:/loadsp";
    }


}
