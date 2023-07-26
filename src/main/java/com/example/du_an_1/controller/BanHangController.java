package com.example.du_an_1.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BanHangController {



    @GetMapping("/ban-hang")
    public String testgiaodien(){


        return "BanHang/ManHinhBanHang";
    }

}
