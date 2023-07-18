package com.example.du_an_1.repository;

import com.example.du_an_1.entity.DongSP;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface DongSPRepository extends JpaRepository<DongSP, UUID> {
}
