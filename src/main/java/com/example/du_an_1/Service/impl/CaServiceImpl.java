package com.example.du_an_1.Service.impl;


import com.example.du_an_1.Service.CaService;
import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.repository.CaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class CaServiceImpl implements CaService {

    @Autowired
    private CaRepository caRepository;


    @Override
    public List<Ca> getAllCas() {
        return caRepository.findAll();
    }

    @Override
    public Ca getCaById(UUID id) {
        return caRepository.findById(id).orElse(null);

    }



}
