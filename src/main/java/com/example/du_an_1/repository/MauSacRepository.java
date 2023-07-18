package com.example.du_an_1.repository;

import com.example.du_an_1.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MauSacRepository extends JpaRepository<MauSac, UUID> {
}
