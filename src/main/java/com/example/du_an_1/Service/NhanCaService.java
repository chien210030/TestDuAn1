package com.example.du_an_1.Service;

import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.entity.NhanCa;
import com.example.du_an_1.entity.NhanVien;
import com.example.du_an_1.pojo.TongTienCa;
import org.springframework.data.domain.Page;

import java.util.List;

public interface NhanCaService {


    List<NhanCa> getAll();

    void save(NhanCa value);

    List<TongTienCa> calculateShiftTotals() ;

    NhanCa batDauCa(NhanVien nhanVien , Ca ca );
    String ketThucCa(NhanCa nhanCa);

    Page<Object[]> getNhanCaAll(int page, int size);

    Page<Object[]> findBySearchQuery(String searchQuery, int page, int size);
}
