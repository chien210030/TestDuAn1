package com.example.du_an_1.controller;

import com.example.du_an_1.entity.*;
import com.example.du_an_1.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ChiTietSPController {

    @Autowired
    private ChiTietSPRepository chiTietSPRepository;
    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private DongSPRepository dongSPRepository;
    @Autowired
        private  ChatLieuRepository chatLieuRepository;
    @Autowired
    private ThuongHieuRepository thuongHieuRepository;
    @Autowired
    private KichCoRepository kichCoRepository;
    @Autowired
    private  MauSacRepository mauSacRepository;
    @Autowired
    private NSXRepository nsxRepository;

@ModelAttribute("sanphams")
private List<SanPham> getsanpham(){

    return sanPhamRepository.findAll();
}
    @ModelAttribute("dongsps")
    private List<DongSP> getdongsp(){

        return dongSPRepository.findAll();
    }
    @ModelAttribute("chatlieus")
    private List<ChatLieu> getchatlieu(){

        return chatLieuRepository.findAll();
    }
    @ModelAttribute("thuonghieus")
    private  List<ThuongHieu> getthuonghieu(){
    return thuongHieuRepository.findAll();

    }
    @ModelAttribute("kichcos")
    private  List<KichCo> getkichKichCos(){
        return kichCoRepository.findAll();

    }
    @ModelAttribute("mausacs")
    private  List<MauSac> getMauSacs(){
        return mauSacRepository.findAll();

    }
    @ModelAttribute("nsxs")
    private  List<MauSac> getNsxs(){
        return mauSacRepository.findAll();

    }



//    Page<ChiTietSP> page;
    @GetMapping("/loadsp")
    public String loadChiTietSP(Model model,
                       @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "ten",required = false) String keyword
                                ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);
        Page<ChiTietSP>    page = chiTietSPRepository.findAll(pageable);
//        if(keyword == null || keyword.isBlank()){
//
//        }else {
//            page =chiTietSPRepository.findBytenContains(keyword,pageable);
//        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("loadSP", page.getContent());


        return "ChiTietSP/ChiTietSPView";
    }

    @GetMapping("/showcreate")
    public String ShowCreate(Model model) {

        model.addAttribute("sanPhams", sanPhamRepository.findAll());

        model.addAttribute("dongsanPhams", dongSPRepository.findAll());
        model.addAttribute("chatlieus", chatLieuRepository.findAll());
        model.addAttribute("thuonghieus", thuongHieuRepository.findAll());
        model.addAttribute("kichcos", kichCoRepository.findAll());
        model.addAttribute("mausacs", mauSacRepository.findAll());
        model.addAttribute("nsxs", nsxRepository.findAll());

//        sanPhamRepository.findAll().forEach(System.out::println);
        return "ChiTietSP/CreateView";
    }
    @PostMapping("/add")
    public String addsp(@Validated @ModelAttribute ChiTietSP chitietsp){
   ChiTietSP t1 = chiTietSPRepository.save(chitietsp);
        return "redirect:/loadsp";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") Long id) {
        chiTietSPRepository.deleteById(id);
        return "redirect:/loadsp";
    }
    @GetMapping("/viewupdate/{id}")
    public String update(Model model,@PathVariable(name = "id") Long id){

        model.addAttribute("loadupdate",chiTietSPRepository.findById(id).orElse(null));

        return "ChiTietSP/update";
    }


}
