package com.example.du_an_1.repository;

import com.example.du_an_1.entity.ChiTietSP;
import com.example.du_an_1.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.UUID;

public interface ChiTietSPRepository  extends JpaRepository<ChiTietSP, UUID> {
//Page<ChiTietSP> findBytenContainsOfsanpham(String keyword, Pageable pageable);
//Page<ChiTietSP> findByMotaContainsAndGiaban(String keyword, BigDecimal giaban, Pageable pageable);
    @Query("select ctsp from ChiTietSP ctsp " +
            "where ctsp.sanpham.ma = :maKeyword or ctsp.sanpham.ten like %:tenKeyword%")
        Page<ChiTietSP> searchByMaAndTen(@Param("maKeyword") String maKeyword,@Param("tenKeyword") String tenKeyword,Pageable pageable);
//    Page<ChiTietSP> findChiTietSPByTenTenContainingIgnoreCaseOrMaTenContainingIgnoreCase(String ten, String ma , Pageable pageable);
}
