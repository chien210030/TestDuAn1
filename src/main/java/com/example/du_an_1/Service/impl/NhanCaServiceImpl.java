//package com.example.du_an_1.Service.impl;
//
//import com.example.du_an_1.Service.NhanCaService;
//import com.example.du_an_1.entity.Ca;
//import com.example.du_an_1.entity.NhanCa;
//import com.example.du_an_1.pojo.TongTienCa;
//import com.example.du_an_1.repository.NhanCaRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.math.BigDecimal;
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.List;
//
//@Service
//public class NhanCaServiceImpl implements NhanCaService {
//
//
//
//    @Autowired
//    private NhanCaRepository repository;
//
//    @Override
//    public List<NhanCa> getAll() {
//        return repository.findAll();
//    }
//
//    @Override
//    public void save(NhanCa value) {
//        repository.save(value);
//    }
//
//    @Override
//    public List<TongTienCa> calculateShiftTotals() {
//        List<TongTienCa> shiftTotals = new ArrayList<>();
//        LocalDate currentDate = LocalDate.now();
//        List<Ca> shifts = repository.findAllCa();
//        for (Ca shift : shifts) {
//            BigDecimal totalTien = repository.calculateTotalTienCa(shift.getId(), currentDate);
//            TongTienCa shiftTotal = new TongTienCa(shift.getTenCa(), totalTien);
//            shiftTotals.add(shiftTotal);
//        }
//        return shiftTotals;
//    }
//
//
//    LocalDateTime currentTime = LocalDateTime.now();
//    LocalDate currentDate = LocalDate.now();
//
//    @Override
//    public String batDauCa(Ca ca) {
//
//
//        NhanCa existingShift = repository.findByCaAndNgayLam(ca, currentDate);
//
//        if (existingShift == null) {
//            NhanCa nhanCa = new NhanCa();
////        nhanVien.setId(UUID.randomUUID());
////        nhanCa.setNhanVien(nhanVien);
//            nhanCa.setCa(ca);
//            nhanCa.setThoiGianBatDau(currentTime);
//            nhanCa.setNgayLam(LocalDate.now());
//            repository.save(nhanCa);
//            return "Bạn nhận ca thành công";
//        } else {
//            return "Ca bạn chọn đã tồn tại";
//        }
//    }
//
//    @Override
//    public String ketThucCa(Ca ca) {
//        NhanCa nhanCa = repository.findByCaAndNgayLam(ca,currentDate);
//
//        if (nhanCa != null) {
//            nhanCa.setThoiGianKetThuc(currentTime);
//            repository.save(nhanCa);
//          return   "Kết thúc ca thành công" ;
//        }
//        return  "Vui lòng chọn ca";
//
//    }
//}
