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

import java.util.ArrayList;
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

    private List<Object[]> addMissingMonthsData(List<Object[]> statsData) {
        List<Object[]> result = new ArrayList<>();

        for (int i = 1; i <= 12; i++) {
            boolean found = false;
            for (Object[] data : statsData) {
                int month = ((Number) data[0]).intValue();
                if (month == i) {
                    found = true;
                    data[1] = data[1] != null ? data[1] : 0;
                    result.add(data);
                    break;
                }
            }
            if (!found) {
                result.add(new Object[]{i, 0});
            }
        }

        return result;
    }
    private int calculateTotalQuantity(List<Object[]> data) {
        int totalQuantity = 0;
        for (Object[] item : data) {
            int quantity = ((Number) item[1]).intValue();
            totalQuantity += quantity;
        }
        return totalQuantity;
    }
    private double calculateTotalProfit(List<Object[]> data) {
        double totalProfit = 0.0;
        for (Object[] item : data) {
            double profit = ((Number) item[1]).doubleValue();
            totalProfit += profit;
        }
        return totalProfit;
    }


    private void setCommonAttributes(Model model, List<Object[]> productStatsData, List<Object[]> orderStatsData, List<Object[]> profitStatsData) throws JsonProcessingException {
        List<Object[]> productStatsDataWithMissingMonths = addMissingMonthsData(productStatsData);
        List<Object[]> orderStatsDataWithMissingMonths = addMissingMonthsData(orderStatsData);
        List<Object[]> profitStatsDataWithMissingMonths = addMissingMonthsData(profitStatsData);

        ObjectMapper objectMapper = new ObjectMapper();
        String productStatsDataJson = objectMapper.writeValueAsString(productStatsDataWithMissingMonths);
        String orderStatsDataJson = objectMapper.writeValueAsString(orderStatsDataWithMissingMonths);
        String profitStatsDataJson = objectMapper.writeValueAsString(profitStatsDataWithMissingMonths);

        model.addAttribute("productStatsDataJson", productStatsDataJson);
        model.addAttribute("orderStatsDataJson", orderStatsDataJson);
        model.addAttribute("profitStatsDataJson", profitStatsDataJson);

        int totalProductQuantity = calculateTotalQuantity(productStatsData);
        int totalOrderCount = calculateTotalQuantity(orderStatsData);
        double totalProfit = calculateTotalProfit(profitStatsData);

        model.addAttribute("totalProductQuantity", totalProductQuantity);
        model.addAttribute("totalOrderCount", totalOrderCount);
        model.addAttribute("totalProfit", totalProfit);
    }

    @GetMapping("/dashboard")
    public String showDashboard(Model model, @RequestParam(value = "selectedYear", defaultValue = "2023") int selectedYear) throws JsonProcessingException {
        List<Object[]> productStatsData = hoaDonChiTietRepository.getTongSoLuongByNam(selectedYear);
        List<Object[]> orderStatsData = hoaDonRepository.getTongDonHangByNam(selectedYear);
        List<Object[]> profitStatsData = hoaDonRepository.getTongTienCanThanhToanByNam(selectedYear);

        setCommonAttributes(model, productStatsData, orderStatsData, profitStatsData);

        return "ThongKe/bieudo";
    }

    @PostMapping("/dashboard")
    public String showDashboard2(Model model, @RequestParam(value = "selectedYear") int selectedYear) throws JsonProcessingException {
        List<Object[]> top5ProductsData = hoaDonChiTietRepository.findTop5BestSellingProducts();
        model.addAttribute("top5ProductsData", top5ProductsData);

        List<Object[]> productStatsData = hoaDonChiTietRepository.getTongSoLuongByNam(selectedYear);
        List<Object[]> orderStatsData = hoaDonRepository.getTongDonHangByNam(selectedYear);
        List<Object[]> profitStatsData = hoaDonRepository.getTongTienCanThanhToanByNam(selectedYear);

        setCommonAttributes(model, productStatsData, orderStatsData, profitStatsData);

        return "ThongKe/bieudo";
    }

//
//    private List<Object[]> addMissingMonthsData(List<Object[]> statsData) {
//        List<Object[]> result = new ArrayList<>();
//
//        for (int i = 1; i <= 12; i++) {
//            boolean found = false;
//            for (Object[] data : statsData) {
//                int month = ((Number) data[0]).intValue();
//                if (month == i) {
//                    found = true;
//                    data[1] = data[1] != null ? data[1] : 0;
//                    result.add(data);
//                    break;
//                }
//            }
//            if (!found) {
//                result.add(new Object[]{i, 0});
//            }
//        }
//
//        return result;
//    }
//
//    @GetMapping("/dashboard")
//    public String showDashboard(Model model, @RequestParam(value = "selectedYear", defaultValue = "2023") int selectedYear) throws JsonProcessingException {
//        // ...
//
//        List<Object[]> productStatsData = hoaDonChiTietRepository.getTongSoLuongByNam(selectedYear);
//        List<Object[]> orderStatsData = hoaDonRepository.getTongDonHangByNam(selectedYear);
//        List<Object[]> profitStatsData = hoaDonRepository.getTongTienCanThanhToanByNam(selectedYear);
//
//        List<Object[]> productStatsDataWithMissingMonths = addMissingMonthsData(productStatsData);
//        List<Object[]> orderStatsDataWithMissingMonths = addMissingMonthsData(orderStatsData);
//        List<Object[]> profitStatsDataWithMissingMonths = addMissingMonthsData(profitStatsData);
//
//        ObjectMapper objectMapper = new ObjectMapper();
//        String productStatsDataJson = objectMapper.writeValueAsString(productStatsDataWithMissingMonths);
//        String orderStatsDataJson = objectMapper.writeValueAsString(orderStatsDataWithMissingMonths);
//        String profitStatsDataJson = objectMapper.writeValueAsString(profitStatsDataWithMissingMonths);
//
//        model.addAttribute("productStatsDataJson", productStatsDataJson);
//        model.addAttribute("orderStatsDataJson", orderStatsDataJson);
//        model.addAttribute("profitStatsDataJson", profitStatsDataJson);
//
//        // Tính tổng số lượng sản phẩm từ danh sách productStatsData
//        int totalProductQuantity = 0;
//        for (Object[] productData : productStatsData) {
//            int productQuantity = ((Number) productData[1]).intValue(); // Số lượng sản phẩm là phần tử thứ 2 trong mảng
//            totalProductQuantity += productQuantity;
//        }
//
//// Tính tổng số lượng đơn hàng từ danh sách orderStatsData
//        int totalOrderCount = 0;
//        for (Object[] orderData : orderStatsData) {
//            int orderCount = ((Number) orderData[1]).intValue(); // Số lượng đơn hàng là phần tử thứ 2 trong mảng
//            totalOrderCount += orderCount;
//        }
//
//// Tính tổng doanh thu từ danh sách profitStatsData
//        double totalProfit = 0.0;
//        for (Object[] profitData : profitStatsData) {
//            double profit = ((Number) profitData[1]).doubleValue(); // Doanh thu là phần tử thứ 2 trong mảng
//            totalProfit += profit;
//        }
//
//// Truyền tổng dữ liệu vào Model để sử dụng trong trang JSP
//        model.addAttribute("totalProductQuantity", totalProductQuantity);
//        model.addAttribute("totalOrderCount", totalOrderCount);
//        model.addAttribute("totalProfit", totalProfit);
//
//
//        return "ThongKe/bieudo";
//    }
//
//
//
//    @PostMapping("/dashboard")
//    public String showDashboard2(Model model, @RequestParam(value = "selectedYear") int selectedYear) throws JsonProcessingException {
//        List<Object[]> top5ProductsData = hoaDonChiTietRepository.findTop5BestSellingProducts();
//        model.addAttribute("top5ProductsData", top5ProductsData);
//
//
//        List<Object[]> productStatsData = hoaDonChiTietRepository.getTongSoLuongByNam(selectedYear);
//        List<Object[]> orderStatsData = hoaDonRepository.getTongDonHangByNam(selectedYear);
//        List<Object[]> profitStatsData = hoaDonRepository.getTongTienCanThanhToanByNam(selectedYear);
//
//        List<Object[]> productStatsDataWithMissingMonths = addMissingMonthsData(productStatsData);
//        List<Object[]> orderStatsDataWithMissingMonths = addMissingMonthsData(orderStatsData);
//        List<Object[]> profitStatsDataWithMissingMonths = addMissingMonthsData(profitStatsData);
//
//        ObjectMapper objectMapper = new ObjectMapper();
//        String productStatsDataJson = objectMapper.writeValueAsString(productStatsDataWithMissingMonths);
//        String orderStatsDataJson = objectMapper.writeValueAsString(orderStatsDataWithMissingMonths);
//        String profitStatsDataJson = objectMapper.writeValueAsString(profitStatsDataWithMissingMonths);
//
//        model.addAttribute("productStatsDataJson", productStatsDataJson);
//        model.addAttribute("orderStatsDataJson", orderStatsDataJson);
//        model.addAttribute("profitStatsDataJson", profitStatsDataJson);
//
//
//        // Tính tổng số lượng sản phẩm từ danh sách productStatsData
//        int totalProductQuantity = 0;
//        for (Object[] productData : productStatsData) {
//            int productQuantity = ((Number) productData[1]).intValue(); // Số lượng sản phẩm là phần tử thứ 2 trong mảng
//            totalProductQuantity += productQuantity;
//        }
//
//// Tính tổng số lượng đơn hàng từ danh sách orderStatsData
//        int totalOrderCount = 0;
//        for (Object[] orderData : orderStatsData) {
//            int orderCount = ((Number) orderData[1]).intValue(); // Số lượng đơn hàng là phần tử thứ 2 trong mảng
//            totalOrderCount += orderCount;
//        }
//
//// Tính tổng doanh thu từ danh sách profitStatsData
//        double totalProfit = 0.0;
//        for (Object[] profitData : profitStatsData) {
//            double profit = ((Number) profitData[1]).doubleValue(); // Doanh thu là phần tử thứ 2 trong mảng
//            totalProfit += profit;
//        }
//
//// Truyền tổng dữ liệu vào Model để sử dụng trong trang JSP
//        model.addAttribute("totalProductQuantity", totalProductQuantity);
//        model.addAttribute("totalOrderCount", totalOrderCount);
//        model.addAttribute("totalProfit", totalProfit);
//        return "ThongKe/bieudo";
//    }

}
