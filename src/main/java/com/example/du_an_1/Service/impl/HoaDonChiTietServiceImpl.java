package com.example.du_an_1.Service.impl;

import com.example.du_an_1.Service.HoaDonChiTietService;
import com.example.du_an_1.entity.HoaDonChiTiet;
import com.example.du_an_1.repository.HoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonChiTietServiceImpl implements HoaDonChiTietService {
    @Autowired
    private HoaDonChiTietRepository repository;


   // @Override
   // public List<HoaDonChiTiet> findByHoaDonMa(String maHD) {
   //     return repository.findByHoaDonMa(maHD);
  //  }

    @Override
    public List<HoaDonChiTiet> getAll() {
        return repository.findAll();
    }

    @Override
    public void save(HoaDonChiTiet value) {
        repository.save(value);
    }

    @Override
    public void deleteById(UUID id) {
        repository.deleteById(id);
    }

    @Override
    public Optional<HoaDonChiTiet> findById(UUID id) {
        return Optional.empty();
    }
    @Override
    public List<Object[]> getListThongKeSP(int month, int year,int trangthai) {
        return repository.getListThongKeSP( month,year,trangthai);
    }

}
