package com.example.du_an_1.repository.impl;

import com.example.du_an_1.entity.KhachHang;
import com.example.du_an_1.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.UUID;

@Repository
public interface NhanVienChucVuRepository extends JpaRepository<NhanVien, UUID> {


    Page<NhanVien> findNhanVienByMaEqualsAndTenEquals(String ma, String ten, Pageable page);

    Page<NhanVien> findNhanVienByMaEquals(String ma,Pageable page);

    Page<NhanVien> findNhanVienByTenEquals(String ten,Pageable page);

   Page<NhanVien> findNhanVienBySdtEquals(String sdt, Pageable page);

}
