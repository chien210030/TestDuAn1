package com.example.du_an_1.controller;

import com.example.du_an_1.Service.impl.CaServiceImpl;
import com.example.du_an_1.Service.impl.HoaDonServiceImpl;
import com.example.du_an_1.Service.impl.NhanCaServiceImpl;
import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.entity.NhanCa;
import com.example.du_an_1.entity.NhanVien;
import com.example.du_an_1.pojo.TongTienCa;
import com.example.du_an_1.repository.impl.NhanVienChucVuRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;
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

    @Autowired
    private NhanVienChucVuRepository nhanVienChucVuRepository;

    @GetMapping
    public String showCas(Model model, @ModelAttribute("mess") String mess) {
        model.addAttribute("cas", caService.getAllCas());
        List<NhanVien> nhanvienList = nhanVienChucVuRepository.findAll();
        model.addAttribute("nhanvien", nhanvienList); // Truyền danh sách nhanvien vào model
        return "Ca/listCas";
    }

    @PostMapping("/nhanCa")
    public String nhanCa(@RequestParam("caId") UUID caId,
                         @RequestParam("nhanvien") UUID nhanvienId,
                         Model model,
                         HttpSession session) {

        List<NhanVien> nhanvienList = nhanVienChucVuRepository.findAll();
        model.addAttribute("nhanvien", nhanvienList); // Truyền danh sách nhanvien vào model
        // Kiểm tra xem có tồn tại currentNhanCa trong session không


        NhanCa currentNhanCa = (NhanCa) session.getAttribute("currentNhanCa");
        if (currentNhanCa != null) {
            // Nếu đã tồn tại currentNhanCa, không cho phép tạo NhanCa mới
            model.addAttribute("mess", "Bạn đã có ca khác đang diễn ra. Kết thúc ca hiện tại trước khi nhận ca mới.");
            model.addAttribute("cas", caService.getAllCas());
            return "Ca/listCas";
        }

        // Nếu không có currentNhanCa, tiến hành tạo NhanCa mới
        Ca ca = caService.getCaById(caId);

        // Sử dụng nhanVienChucVuRepository để tìm NhanVien dựa trên ID
        Optional<NhanVien> optionalNhanVien = nhanVienChucVuRepository.findById(nhanvienId);

        if (optionalNhanVien.isPresent()) {
            NhanVien nhanVien = optionalNhanVien.get();
            NhanCa nhanCa = nhanCaService.batDauCa(nhanVien,ca);

            if (nhanCa != null) {
                session.setAttribute("currentNhanCa", nhanCa); // Lưu nhanCa vào session
                model.addAttribute("mess", "Bạn nhận ca thành công");
                model.addAttribute("cas", caService.getAllCas());
            } else {
                model.addAttribute("mess", "Ca đã tồn tại");
                model.addAttribute("cas", caService.getAllCas());
            }
        } else {
            // Xử lý trường hợp không tìm thấy NhanVien với ID đã chọn
            model.addAttribute("mess", "Không tìm thấy nhân viên với ID đã chọn");
            model.addAttribute("cas", caService.getAllCas());
        }

        return "Ca/listCas";
    }


    @PostMapping("/ketCa")
    public String ketCa(Model model, HttpSession session) {

        List<NhanVien> nhanvienList = nhanVienChucVuRepository.findAll();
        model.addAttribute("nhanvien", nhanvienList); // Truyền danh sách nhanvien vào model
        NhanCa currentNhanCa = (NhanCa) session.getAttribute("currentNhanCa");
        String mess = nhanCaService.ketThucCa(currentNhanCa);

        if (mess.equals("Kết thúc ca thành công")) {
            session.removeAttribute("currentNhanCa"); // Xóa nhanCa khỏi session
            model.addAttribute("mess", "Kết thúc ca thành công");
        } else {
            model.addAttribute("mess", "Vui lòng chọn ca");
        }
        return "redirect:/ca";
    }



    @GetMapping("/thongKe")
    public String showSummary(Model model) {
        // Tính tổng tiền các ca
        List<TongTienCa> shiftTotals = nhanCaService.calculateShiftTotals();


        model.addAttribute("shiftTotals", shiftTotals);


        return "Ca/thongke";
    }

    @GetMapping("/list")
    public String listNhanCa(Model model,
                             @RequestParam(name = "page", defaultValue = "0") int page,
                             @RequestParam(name = "size", defaultValue = "10") int size) {
        Page<Object[]> nhanCaInfo = nhanCaService.getNhanCaAll(page, size);
        model.addAttribute("nhanCaInfo", nhanCaInfo);
        return "Ca/listNhanCa";
    }

    @GetMapping("/search")
    public String search(@RequestParam(name = "searchQuery", required = false) String searchQuery,
                         @RequestParam(name = "page", defaultValue = "0") int page,
                         @RequestParam(name = "size", defaultValue = "10") int size,
                         Model model) {
        if (searchQuery != null && !searchQuery.isEmpty()) {
            Page<Object[]> nhanCaInfo = nhanCaService.findBySearchQuery(searchQuery, page, size);
            model.addAttribute("nhanCaInfo", nhanCaInfo);
            return "Ca/listNhanCa";
        }
        return "redirect:/ca/list";

    }


}