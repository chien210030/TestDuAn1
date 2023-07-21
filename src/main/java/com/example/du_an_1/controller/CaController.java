package com.example.du_an_1.controller;

import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.repository.impl.CaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CaController {
    @Autowired
     private CaRepository caRepository;

    @GetMapping("/ca/hien-thi")
    public String ca(Model model) {

        return "Ca/index";
    }


    @PostMapping("/ca/add")
    public String addCa( @ModelAttribute("ca") Ca ca) {
       caRepository.save(ca);
        return "redirect:/ca/hien-thi";
    }

}
