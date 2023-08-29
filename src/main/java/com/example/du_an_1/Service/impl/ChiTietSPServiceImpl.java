package com.example.du_an_1.Service.impl;

import com.example.du_an_1.Service.ChiTIetService;
import com.example.du_an_1.entity.ChiTietSP;
import com.example.du_an_1.repository.ChiTietSPRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiTietSPServiceImpl implements ChiTIetService {
    @Autowired
    ChiTietSPRepository chiTietSPRepository;

    @Override
    public Page<ChiTietSP> getall(Pageable pageable) {
        return chiTietSPRepository.findAll(pageable);
    }
}
