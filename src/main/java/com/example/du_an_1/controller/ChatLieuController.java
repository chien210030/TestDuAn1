package com.example.du_an_1.controller;


import com.example.du_an_1.entity.ChatLieu;
import com.example.du_an_1.entity.DongSP;
import com.example.du_an_1.repository.ChatLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
public class ChatLieuController {

    @Autowired
    private ChatLieuRepository chatLieuRepository;
    @GetMapping("/loadchatlieu")
    public String sanpham(Model model,
                          @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "ten",required = false) String keyword
    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<ChatLieu> page =  chatLieuRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("ChatLieu", page.getContent());


        return "ChiTietSP/DSChatLieu";
    }
    @GetMapping("/viewaddChatLieu")
    public String viewaddsanpham(){

        return "ChiTietSP/viewaddChatLieu";
    }
    @PostMapping("/addChatLieu")
    public String addchatlieu(Model model,@ModelAttribute ChatLieu chatLieu) {
        ChatLieu t1 = chatLieuRepository.save(chatLieu);
        return "redirect:/loadchatlieu";
    }
    @GetMapping("/deleteChatLieu/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        chatLieuRepository.deleteById(id);
        return "redirect:/loadchatlieu";
    }
    @GetMapping("/updatechatlieu/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("updateChatLieu",chatLieuRepository.findById(id).orElse(null));

        return "ChiTietSP/viewupdateChatLieu";
    }

}
