package com.example.du_an_1.controller;

import com.example.du_an_1.Service.impl.HoaDonChiTietServiceImpl;
import com.example.du_an_1.repository.HoaDonChiTietRepository;
import com.example.du_an_1.repository.HoaDonRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/thongke")
public class ThongKeController {

    @Autowired
    private HoaDonChiTietServiceImpl hoaDonChiTietService;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository  hoaDonChiTietRepository;

    private void addMissingMonthsData(List<Object[]> statsData) {
        for (int i = 1; i <= 12; i++) {
            boolean found = false;
            for (Object[] data : statsData) {
                int month = ((Number) data[0]).intValue();
                if (month == i) {
                    found = true;
                    data[1] = data[1] != null ? data[1] : 0;
                    break;
                }
            }
            if (!found) {
                statsData.add(new Object[]{i, 0});
            }
        }
    }
    @GetMapping("/dashboard")
    public String showDashboard(Model model, @RequestParam(value = "selectedYear", defaultValue = "2023") int selectedYear) throws JsonProcessingException {
        List<Object[]> top5ProductsData = hoaDonChiTietRepository.findTop5BestSellingProducts();
        model.addAttribute("top5ProductsData", top5ProductsData);

        List<Object[]> productStatsData = hoaDonChiTietRepository.getTongSoLuongByNam(selectedYear);
        List<Object[]> orderStatsData = hoaDonRepository.getTongDonHangByNam(selectedYear);
        List<Object[]> profitStatsData = hoaDonRepository.getTongTienCanThanhToanByNam(selectedYear);

        addMissingMonthsData(productStatsData);
        addMissingMonthsData(orderStatsData);
        addMissingMonthsData(profitStatsData);

        ObjectMapper objectMapper = new ObjectMapper();
        String productStatsDataJson = objectMapper.writeValueAsString(productStatsData);
        String orderStatsDataJson = objectMapper.writeValueAsString(orderStatsData);
        String profitStatsDataJson = objectMapper.writeValueAsString(profitStatsData);

        model.addAttribute("productStatsDataJson", productStatsDataJson);
        model.addAttribute("orderStatsDataJson", orderStatsDataJson);
        model.addAttribute("profitStatsDataJson", profitStatsDataJson);
        model.addAttribute("hello", "hello");

        return "ThongKe/bieudo";
    }


    @PostMapping("/dashboard")
    public String showDashboard2(Model model, @RequestParam(value = "selectedYear", defaultValue = "2023") int selectedYear) throws JsonProcessingException {
        List<Object[]> top5ProductsData = hoaDonChiTietRepository.findTop5BestSellingProducts();
        model.addAttribute("top5ProductsData", top5ProductsData);


        List<Object[]> productStatsData = hoaDonChiTietRepository.getTongSoLuongByNam(selectedYear);
        List<Object[]> orderStatsData = hoaDonRepository.getTongDonHangByNam(selectedYear);
        List<Object[]> profitStatsData = hoaDonRepository.getTongTienCanThanhToanByNam(selectedYear);

        addMissingMonthsData(productStatsData);
        addMissingMonthsData(orderStatsData);
        addMissingMonthsData(profitStatsData);

        ObjectMapper objectMapper = new ObjectMapper();
        String productStatsDataJson = objectMapper.writeValueAsString(productStatsData);
        String orderStatsDataJson = objectMapper.writeValueAsString(orderStatsData);
        String profitStatsDataJson = objectMapper.writeValueAsString(profitStatsData);

        model.addAttribute("productStatsDataJson", productStatsDataJson);
        model.addAttribute("orderStatsDataJson", orderStatsDataJson);
        model.addAttribute("profitStatsDataJson", profitStatsDataJson);
        model.addAttribute("hello", "hello");

        return "ThongKe/bieudo";
    }

}
