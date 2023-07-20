package com.example.du_an_1.Service.impl;

import com.example.du_an_1.Service.SanPhamService;
import com.example.du_an_1.entity.SanPham;
import com.example.du_an_1.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class sanphamServiceImpl implements SanPhamService {

    @Autowired
   private SanPhamRepository sanPhamRepository;


    @Override
    public List<SanPham> getDSSP(Pageable pageable) {

        return sanPhamRepository.findAll();
    }
}
