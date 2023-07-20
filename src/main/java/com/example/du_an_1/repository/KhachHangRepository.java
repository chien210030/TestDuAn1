package com.example.du_an_1.repository;

import com.example.du_an_1.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {
    Page<KhachHang> findKhachHangByMaEqualsAndTenEquals(String ma,String ten,Pageable page);

    Page<KhachHang> findKhachHangByMaEquals(String ma,Pageable page);

    Page<KhachHang> findKhachHangByTenEquals(String ten,Pageable page);

}
