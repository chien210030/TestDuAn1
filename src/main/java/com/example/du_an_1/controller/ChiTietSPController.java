package com.example.du_an_1.controller;

import com.example.du_an_1.repository.ChiTietSPRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChiTietSPController {

    @Autowired
    private ChiTietSPRepository chiTietSPRepository;

    @GetMapping("/loadsp")
    public String  loadChiTietSP(Model model){
        model.addAttribute("loadSP",chiTietSPRepository.findAll());


        return "ChiTietSP/ChiTietSPView";
    }






}
