package com.example.du_an_1.repository.impl;

import com.example.du_an_1.entity.ChucVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChucVuRepository extends JpaRepository<ChucVu,Integer> {
}
