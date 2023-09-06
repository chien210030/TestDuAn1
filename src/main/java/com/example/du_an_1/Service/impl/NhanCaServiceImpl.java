package com.example.du_an_1.Service.impl;

import com.example.du_an_1.Service.NhanCaService;
import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.entity.NhanCa;
import com.example.du_an_1.entity.NhanVien;
import com.example.du_an_1.pojo.TongTienCa;
import com.example.du_an_1.repository.NhanCaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
@Service
public class NhanCaServiceImpl implements NhanCaService {



    @Autowired
    private NhanCaRepository repository;

    @Override
    public List<NhanCa> getAll() {
        return repository.findAll();
    }

    @Override
    public void save(NhanCa value) {
        repository.save(value);
    }

    @Override
    public List<TongTienCa> calculateShiftTotals() {
        List<TongTienCa> shiftTotals = new ArrayList<>();
        LocalDate currentDate = LocalDate.now();
        List<Ca> shifts = repository.findAllCa();
        for (Ca shift : shifts) {
            BigDecimal totalTien = repository.calculateTotalTienCa(shift.getId(), currentDate);
            TongTienCa shiftTotal = new TongTienCa(shift.getTenCa(), totalTien);
            shiftTotals.add(shiftTotal);
        }
        return shiftTotals;
    }


    LocalDateTime currentTime = LocalDateTime.now();
    LocalDate currentDate = LocalDate.now();

    @Override
    public NhanCa batDauCa(NhanVien nhanVien , Ca ca) {
        NhanCa existingShift = repository.findByCaAndNgayLam(ca, currentDate);
        if (existingShift == null) {
            NhanCa nhanCa = new NhanCa();
            // Cài đặt các thuộc tính của nhanCa
            nhanCa.setNhanVien(nhanVien);
            nhanCa.setCa(ca);
            nhanCa.setThoiGianBatDau(currentTime);
            nhanCa.setNgayLam(LocalDate.now());
            repository.save(nhanCa);
            return nhanCa; // Trả về nhanCa đã tạo
        } else {
            return null; // Trả về null nếu ca đã tồn tại
        }
    }
    @Override
    public String ketThucCa(NhanCa nhanCa) {
        if (nhanCa != null) {
            nhanCa.setThoiGianKetThuc(currentTime);
            repository.save(nhanCa);
            return "Kết thúc ca thành công";
        }
        return "Vui lòng chọn ca";
    }

    @Override
    public Page<Object[]> getNhanCaAll(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return repository.getNhanCaAll(pageable);
    }

    @Override
    public Page<Object[]> findBySearchQuery(String searchQuery, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return repository.findBySearchQuery(searchQuery,pageable);
    }
}