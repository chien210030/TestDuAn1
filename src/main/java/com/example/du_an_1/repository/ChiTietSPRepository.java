package com.example.du_an_1.repository;

import com.example.du_an_1.entity.ChiTietSP;
import com.example.du_an_1.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChiTietSPRepository  extends JpaRepository<ChiTietSP,Integer> {
//Page<ChiTietSP> findBytenContainsOfsanpham(String keyword, Pageable pageable);
//Page<SanPham> findByTenContains(String keyword, Pageable pageable);
}
