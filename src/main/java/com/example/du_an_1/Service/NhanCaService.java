package com.example.du_an_1.Service;

import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.entity.NhanCa;
import com.example.du_an_1.pojo.TongTienCa;

import java.util.List;

public interface NhanCaService {

    List<NhanCa> getAll();

    void save(NhanCa value);

     List<TongTienCa> calculateShiftTotals() ;

     String batDauCa(Ca ca );
     String ketThucCa(Ca ca);
}
