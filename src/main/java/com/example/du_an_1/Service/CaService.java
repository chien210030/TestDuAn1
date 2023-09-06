package com.example.du_an_1.Service;

import com.example.du_an_1.entity.Ca;

import java.util.List;
import java.util.UUID;

public interface CaService {

    List<Ca> getAllCas();

    Ca getCaById(UUID id);
}
