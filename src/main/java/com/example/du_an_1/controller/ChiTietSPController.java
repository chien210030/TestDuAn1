package com.example.du_an_1.controller;

import com.example.du_an_1.entity.*;
import com.example.du_an_1.repository.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
//@SessionAttributes("loadchitietsp")
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
    public List<DongSP> getdongsp(){

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

    Page<ChiTietSP> page;
    @GetMapping("/loadsp")
    public String loadChiTietSP(Model model,
                                @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "keyword",required = false) String keyword

                                ) {

        Pageable pageable= PageRequest.of(pageNum-1,4);

        if(keyword == null || keyword.isBlank()){
            page = chiTietSPRepository.findAll(pageable);
        }else {

        }


        model.addAttribute("totalpages",page.getTotalPages());
        model.addAttribute("loadSP", page.getContent());


        return "ChiTietSP/ChiTietSPView";
    }

    @GetMapping("/search")
    public String search(Model model,
                                @RequestParam(name = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "keyword",required = false) String keyword

    ) {

        Pageable pageable= PageRequest.of(pageNum-1,2);

        if(keyword == null || keyword.isBlank()){
            page = chiTietSPRepository.findAll(pageable);
        }else {
            page =chiTietSPRepository.searchByMaAndTen(keyword,keyword,pageable);
        }


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
    public String delete(@PathVariable(name = "id") UUID id) {
        chiTietSPRepository.deleteById(id);
        return "redirect:/loadsp";
    }
    @GetMapping("/viewupdate/{id}")
    public String update(Model model,@PathVariable(name = "id")  UUID id){

        model.addAttribute("loadupdate",chiTietSPRepository.findById(id).orElse(null));

        return "ChiTietSP/update";
    }

    @GetMapping("/exportExcel/{id}")
    public ModelAndView exportExcel(@PathVariable UUID id) {
        ChiTietSP product = chiTietSPRepository.findById(id).orElse(null);

        return new ModelAndView(new AbstractXlsxView() {
            @Override
            protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
                response.setHeader("Content-Disposition", "attachment; filename=\"" + product.getSanpham().getTen() + "CTSP.xlsx\"");
                Sheet sheet = workbook.createSheet("Product Detail");
                Row header = sheet.createRow(0);
                header.createCell(0).setCellValue("Ma");
                header.createCell(1).setCellValue("Ten");
                header.createCell(2).setCellValue("Mo Ta");
                header.createCell(3).setCellValue("So Luong Ton");
                header.createCell(4).setCellValue("Gia Ban");
                header.createCell(5).setCellValue("Dong SP");
                header.createCell(6).setCellValue("Nha San Xuat");
                header.createCell(7).setCellValue("Mau Sac");
                header.createCell(8).setCellValue("Kich Co");
                header.createCell(9).setCellValue("Chat Lieu");
                header.createCell(10).setCellValue("Thuong Hieu");



                // Thêm các cột khác tương tự

                Row dataRow = sheet.createRow(1);
                dataRow.createCell(0).setCellValue(product.getSanpham().getMa());
                dataRow.createCell(1).setCellValue(product.getSanpham().getTen());
                dataRow.createCell(2).setCellValue(product.getMota());
                dataRow.createCell(3).setCellValue(product.getSoluongton());
                dataRow.createCell(4).setCellValue(product.getGiaban().toString());
                dataRow.createCell(5).setCellValue(product.getDongsp().getTen());
                dataRow.createCell(6).setCellValue(product.getNsx().getTen());
                dataRow.createCell(7).setCellValue(product.getMausac().getTen());
                dataRow.createCell(8).setCellValue(product.getKichco().getTen());
                dataRow.createCell(9).setCellValue(product.getChatlieu().getTen());
                dataRow.createCell(10).setCellValue(product.getThuonghieu().getTen());

                // Điền dữ liệu của sản phẩm vào các cột tương ứng

                // Ghi xuống response
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                workbook.write(response.getOutputStream());
            }
        });
    }
}



