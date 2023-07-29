package com.example.du_an_1.controller;


import com.example.du_an_1.Service.KhuyenMaiService;
import com.example.du_an_1.entity.KhachHang;
import com.example.du_an_1.entity.KhuyenMai;
import com.example.du_an_1.repository.KhuyenMaiRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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

        //        nối bảng nào
        UUID id;
//        Long maKhachHang;
    }

    @ModelAttribute("dsTrangThai")
    public Map<Integer, String> getDsTrangThai(){
        Map<Integer, String> dsTrangThai = new HashMap<>();
        dsTrangThai.put(1, "Hoạt động");
        dsTrangThai.put(0, "Không hoạt động");
        return dsTrangThai;
    }

    @RequestMapping("/khuyen-mai/sort")
    public String sort(Model model, @RequestParam(defaultValue="0")int p,
                       @ModelAttribute("searchForm") SearchForm searchForm) {

        // Sap xep theo nhieu truong

        Sort sort = Sort.by(
                new Sort.Order(Sort.Direction.ASC, "ngaybatdau"),
                new Sort.Order(Sort.Direction.ASC, "ten")
        );
        Pageable pageable = PageRequest.of(p, 5, sort);
        Page<KhuyenMai> page = khuyenMaiService.search(
                searchForm.fromDate, searchForm.toDate, searchForm.id, pageable
        );

        model.addAttribute("khuyenmai", new KhuyenMai());
        model.addAttribute("page", page);
        return "KhuyenMai/index";
    }


    //Lấy ds mã khuyến mãi
    @RequestMapping("/khuyen-mai/index")
    public String listKhuyenMai(Model model, @RequestParam(defaultValue="0")int p,
                                @ModelAttribute("searchForm") SearchForm searchForm)
    {
        System.out.println("searchForm="+ searchForm);
        Pageable pageable = PageRequest.of(p, 5);
        Page<KhuyenMai> page = khuyenMaiService.search(
                searchForm.fromDate, searchForm.toDate, searchForm.id, pageable
        );
        model.addAttribute("khuyenmai", new KhuyenMai());
        model.addAttribute("page", page);

        return "KhuyenMai/index";
    }

    //Tạo mã khuyến mãi

    @GetMapping("/khuyen-mai/view-add")
    public String viewAdd(Model model, @Validated @ModelAttribute("khuyenmai") KhuyenMai khuyenMai, BindingResult bindingResult){

        model.addAttribute("khuyenmai",new KhuyenMai());

        return "KhuyenMai/_add";
    }

    @PostMapping("/khuyen-mai/add")
    public String createKhuyenMai(Model model,
                                  @ModelAttribute("khuyenmai") KhuyenMai khuyenMai,
                                  BindingResult bindingResult) {

        boolean hasErrors = bindingResult.hasErrors();

        if(khuyenMai.getNgaybatdau() != null && khuyenMai.getNgayketthuc() != null &&
                khuyenMai.getNgaybatdau().getTime() > khuyenMai.getNgayketthuc().getTime()
        ) {
            model.addAttribute("dateError", "Ngày bắt đầu phải trước ngày kết thúc");
            hasErrors = true;
        }

        //Nối bảng nào
//        if(khuyenMai.gettablegi().getMa() == null) {
//            model.addAttribute("maKHError", " không được bỏ trống");
//            hasErrors = true;
//        }

        if(hasErrors){
            model.addAttribute("searchForm", new SearchForm());
            model.addAttribute("message", "Một số trường đang có lỗi");
            return "KhuyenMai/index";
        }

        khuyenMaiService.save(khuyenMai);
        return "redirect:/khuyen-mai/index";
    }

    //View form update
    @GetMapping("/khuyen-mai/view-update/{id}")
    public String viewUpdate(@PathVariable UUID id, Model model){
        KhuyenMai khuyenMai = khuyenMaiService.getByKhuyenMai(id);
        model.addAttribute("khuyenmai", khuyenMai);
        return "KhuyenMai/update";
    }

    //Update mã khuyến mãi
    @PostMapping("/khuyen-mai/update/{id}")
    public String update(@PathVariable UUID id, Model model,
                         @ModelAttribute("khuyenmai") KhuyenMai khuyenMai,
                         BindingResult bindingResult){


        boolean hasErrors = bindingResult.hasErrors();

        if(khuyenMai.getNgaybatdau() != null && khuyenMai.getNgayketthuc() != null &&
                khuyenMai.getNgaybatdau().getTime() > khuyenMai.getNgayketthuc().getTime()
        ) {
            model.addAttribute("dateError", "Ngày bắt đầu phải trước ngày kết thúc");
            hasErrors = true;
        }
        //nối bảng nào
//        if(phieugiamgia.getNguoisohuu().getMakhachhang() == null) {
//            model.addAttribute("maKHError", "Khách hàng không được bỏ trống");
//            hasErrors = true;
//        }

        if(hasErrors){
            model.addAttribute("message", "Một số trường đang có lỗi");
            return "KhuyenMai/update";
        }


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
    public String detail(@PathVariable UUID id, Model model){
        KhuyenMai khuyenMai = khuyenMaiService.getByKhuyenMai(id);
        model.addAttribute("khuyenmai", khuyenMai);
        return "KhuyenMai/detail";
    }

    //Xoa mã khuyến mãi
    @RequestMapping("/khuyen-mai/remove/{id}")
    public String deleteKhuyenMai(@PathVariable UUID id){
        khuyenMaiService.deleteByKhuyenMai(id);
        return "redirect:/khuyen-mai/index";
    }



}
