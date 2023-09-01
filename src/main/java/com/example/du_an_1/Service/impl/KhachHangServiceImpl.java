package com.example.du_an_1.Service.impl;

import com.example.du_an_1.Service.KhachHangService;
import com.example.du_an_1.entity.KhachHang;
import com.example.du_an_1.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangServiceImpl implements KhachHangService {

    @Autowired
 KhachHangRepository khachHangRepository;
    @Override
    public List<KhachHang> getall() {
        return khachHangRepository.findAll();
    }

    @Override
    public KhachHang getsdt(String sdt) {
        return khachHangRepository.findBySdt(sdt);
    }

    @Override
    public KhachHang add(KhachHang kh) {

        return khachHangRepository.save(kh);
    }
}
