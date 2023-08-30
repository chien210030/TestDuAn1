package com.example.du_an_1.Service.impl;

import com.example.du_an_1.Service.HoaDonChiTietService;
import com.example.du_an_1.Service.HoaDonService;
import com.example.du_an_1.entity.HoaDon;
import com.example.du_an_1.entity.HoaDonChiTiet;
import com.example.du_an_1.repository.HoaDonChiTietRepository;
import com.example.du_an_1.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    private HoaDonRepository repository;


    @Override
    public List<HoaDon> getAll() {
        return repository.findAll();
    }

    @Override
    public void save(HoaDon value) {
        repository.save(value);
    }

    @Override
    public void deleteById(UUID id) {
        repository.deleteById(id);
    }

    @Override
    public Optional<HoaDon> findById(UUID id) {
        return Optional.empty();
    }

    @Override
    public int getCompletedOrdersCount() {
        Date currentDate = new Date();
        return repository.countByTrangthaiAndNgaytao(1, currentDate);
    }

    @Override
    public int getProcessingOrdersCount() {
        Date currentDate = new Date();
        return repository.countByTrangthaiAndNgaytao(0, currentDate);
    }

}