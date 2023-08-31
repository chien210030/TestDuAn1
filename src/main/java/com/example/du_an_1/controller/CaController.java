package com.example.du_an_1.controller;

import com.example.du_an_1.Service.impl.CaServiceImpl;
import com.example.du_an_1.Service.impl.HoaDonServiceImpl;
import com.example.du_an_1.Service.impl.NhanCaServiceImpl;
import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.pojo.TongTienCa;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/ca")
public class CaController {

    @Autowired
    private CaServiceImpl caService;

    @Autowired
    private NhanCaServiceImpl nhanCaService;

    @Autowired
    private HoaDonServiceImpl donHangService;

    @GetMapping
    public String showCas(Model model, @ModelAttribute("mess") String mess) {
        model.addAttribute("cas", caService.getAllCas());
        return "Ca/listCas";
    }

    @PostMapping("/nhanCa")
    public String nhanCa(@RequestParam("caId") UUID caId, Model model, HttpSession session) {
        String mess2 = nhanCaService.batDauCa(caService.getCaById(caId));

        if (mess2.equals("Bạn nhận ca thành công")) {
            session.setAttribute("currentCa", caService.getCaById(caId));
            model.addAttribute("mess", "Bạn nhận ca thành công");
            model.addAttribute("cas", caService.getAllCas());
            return "Ca/listCas";
        }
        model.addAttribute("mess", "Ca đã tồn tại");
        model.addAttribute("cas", caService.getAllCas());
        return "Ca/listCas";
    }


    @PostMapping("/ketCa")
    public String ketCa(Model model, HttpSession session) {
        Ca currentCa = (Ca) session.getAttribute("currentCa");
        String mess = nhanCaService.ketThucCa(currentCa);
        if (mess.equals("Kết thúc ca thành công")) {
            session.removeAttribute("currentCa"); // Xóa thông tin ca hiện tại khỏi session
            model.addAttribute(mess, "Kết thúc ca thành công");
        } else {
            model.addAttribute(mess, "Vui lòng chọn ca");
        }

        return "redirect:/ca";
    }

    @GetMapping("/thongKe")
    public String showSummary(Model model) {
        // Tính tổng tiền các ca
        List<TongTienCa> shiftTotals = nhanCaService.calculateShiftTotals();

        // Tính tổng số đơn đã hoàn thành
        int completedOrders = donHangService.getCompletedOrdersCount();

        // Tính tổng số đơn đang xử lý
        int processingOrders = donHangService.getProcessingOrdersCount();

        model.addAttribute("shiftTotals", shiftTotals);
        model.addAttribute("completedOrders", completedOrders);
        model.addAttribute("processingOrders", processingOrders);

        return "Ca/thongKe";
    }



}
