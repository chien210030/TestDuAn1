package com.example.du_an_1.repository;

import com.example.du_an_1.entity.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;

public interface KhuyenMaiRepository extends JpaRepository<KhuyenMai, Integer> {
    @Query("SELECT p FROM KhuyenMai p WHERE (?1 IS NULL OR p.ngaybatdau >= ?1) AND (?2 IS NULL OR p.ngayketthuc <= ?2)")
    Page<KhuyenMai> search(Date startDate, Date endDate, Pageable pageable);

}
