package com.example.du_an_1.controller;


import com.example.du_an_1.Service.KhuyenMaiService;
import com.example.du_an_1.entity.KhuyenMai;
import com.example.du_an_1.repository.KhuyenMaiRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class KhuyenMaiController {

    @Autowired
    KhuyenMaiService khuyenMaiService;


    @Data
    public static class SearchForm {
        @DateTimeFormat(pattern = "dd/MM/yyyy")
        Date fromDate;

        @DateTimeFormat(pattern = "dd/MM/yyyy")
        Date toDate;

//        Long maKhachHang;
    }

    @ModelAttribute("dsTrangThai")
    public Map<Integer, String> getDsTrangThai(){
        Map<Integer, String> dsTrangThai = new HashMap<>();
        dsTrangThai.put(1, "Hoạt động");
        dsTrangThai.put(0, "Không hoạt động");
        return dsTrangThai;
    }

    //Lấy ds mã khuyến mãi
    @GetMapping("/khuyen-mai/index")
    public String listKhuyenMai(Model model, @RequestParam(defaultValue="0")int p,
    @ModelAttribute("searchForm") SearchForm searchForm)
    {
        System.out.println("searchForm="+ searchForm);
        Pageable pageable = PageRequest.of(p, 5);
        Page<KhuyenMai> page = khuyenMaiService.search(
                searchForm.fromDate, searchForm.toDate, pageable
        );
        model.addAttribute("khuyenmai", new KhuyenMai());
        model.addAttribute("page", page);

        return "KhuyenMai/index";
    }

    //Tạo mã khuyến mãi

    @PostMapping("/khuyen-mai/add")
    public String createKhuyenMai(Model model,
                                  @ModelAttribute("khuyenmai") KhuyenMai khuyenMai,
            BindingResult bindingResult) {

        khuyenMaiService.save(khuyenMai);
        return "redirect:/khuyen-mai/index";
    }

    //View form update
    @GetMapping("/khuyen-mai/view-update/{id}")
    public String viewUpdate(@PathVariable Integer id, Model model){
        KhuyenMai khuyenMai = khuyenMaiService.getByKhuyenMai(id);
        model.addAttribute("khuyenmai", khuyenMai);
        return "KhuyenMai/update";
    }

    //Update mã khuyến mãi
    @PostMapping("/khuyen-mai/update/{id}")
    public String update(@PathVariable Integer id, Model model,
                         @ModelAttribute("khuyenmai") KhuyenMai khuyenMai,
                         BindingResult bindingResult){
        System.out.println("ma" + khuyenMai.getMa());
        System.out.println("ten" + khuyenMai.getTen());
        System.out.println("ngaybatdau" + khuyenMai.getNgaybatdau());
        System.out.println("ngayketthuc" + khuyenMai.getNgayketthuc());
        System.out.println("hinhthuckm" + khuyenMai.getHinhthuckm());
        System.out.println("giatrigiam" + khuyenMai.getGiatrigiam());
        System.out.println("trangthai" + khuyenMai.getTrangthai());

        KhuyenMai khuyenmaiupdate = khuyenMaiService.getByKhuyenMai(id);
        if (khuyenmaiupdate != null){
            khuyenmaiupdate.setMa(khuyenMai.getMa());
            khuyenmaiupdate.setTen(khuyenMai.getTen());
            khuyenmaiupdate.setNgaybatdau(khuyenMai.getNgaybatdau());
            khuyenmaiupdate.setNgayketthuc(khuyenMai.getNgayketthuc());
            khuyenmaiupdate.setHinhthuckm(khuyenMai.getHinhthuckm());
            khuyenmaiupdate.setGiatrigiam(khuyenMai.getGiatrigiam());
            khuyenmaiupdate.setTrangthai(khuyenMai.getTrangthai());
            khuyenMaiService.save(khuyenmaiupdate);
        }

        return "redirect:/khuyen-mai/index";
    }

    //Hiển thị chi tiết khuyến mãi
    @GetMapping("/khuyen-mai/detail/{id}")
    public String detail(@PathVariable Integer id, Model model){
        KhuyenMai khuyenMai = khuyenMaiService.getByKhuyenMai(id);
        model.addAttribute("khuyenmai", khuyenMai);
        return "KhuyenMai/detail";
    }

    //Xoa mã khuyến mãi
    @RequestMapping("/khuyen-mai/remove/{id}")
    public String deleteKhuyenMai(@PathVariable Integer id){
        khuyenMaiService.deleteByKhuyenMai(id);
        return "redirect:/khuyen-mai/index";
    }



}
