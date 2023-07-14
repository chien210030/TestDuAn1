package com.example.du_an_1.controller;

import com.example.du_an_1.entity.ChiTietSP;
import com.example.du_an_1.repository.ChiTietSPRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

@Controller

public class ChiTietSPController {

    @Autowired
    private ChiTietSPRepository chiTietSPRepository;

    @GetMapping("/loadsp")
    public String  loadChiTietSP(Model model){
        model.addAttribute("loadSP",chiTietSPRepository.findAll());


        return "ChiTietSP/ChiTietSPView";
    }
    @GetMapping("/showCreate")
 public String showCreateChiTietSP(Model model){
//        model.addAttribute("ViewCreate",new ChiTietSP());
        model.addAttribute("loadCBbox",chiTietSPRepository.findAll());
        return "ChiTietSP/CreateView";
 }
 public String addsp(@ModelAttribute() ChiTietSP chiTietSP){

        return "";
 }

@GetMapping("/delete/{id}")
public String deleteSP( @PathVariable(name = "id") Integer id){
    chiTietSPRepository.deleteById(id);
 return "redirect:/loadsp";
}



}
