package com.example.du_an_1.Service;

import com.example.du_an_1.entity.HoaDon;

import java.util.List;
import java.util.Optional;
import java.util.UUID;


public interface HoaDonService {

    List<HoaDon> getAll();

    void save(HoaDon value);

    void deleteById(UUID id);

    Optional<HoaDon> findById(UUID id);

}
