package com.example.du_an_1.Service.impl;

import com.example.du_an_1.Service.KhuyenMaiService;
import com.example.du_an_1.entity.KhuyenMai;
import com.example.du_an_1.repository.KhuyenMaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class KhuyenMaiServiceImpl implements KhuyenMaiService {

    @Autowired
    KhuyenMaiRepository khuyenMaiRepository;

    @Override
    public KhuyenMai getByKhuyenMai(UUID id) {
        return khuyenMaiRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteByKhuyenMai(UUID id) {
        khuyenMaiRepository.deleteById(id);
    }

    @Override
    public void save(KhuyenMai khuyenMai) {

        khuyenMaiRepository.save(khuyenMai);
    }

    @Override
    public List<KhuyenMai> getDsKhuyenMai() {
        return null;
    }



    @Override
    public Page<KhuyenMai> search(Date fromDate, Date toDate, UUID id, Pageable pageable) {
        return khuyenMaiRepository.search(fromDate, toDate, id, pageable);
    }
}