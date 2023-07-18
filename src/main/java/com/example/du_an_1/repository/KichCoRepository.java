package com.example.du_an_1.repository;

import com.example.du_an_1.entity.KichCo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface KichCoRepository extends JpaRepository<KichCo, UUID> {
}
