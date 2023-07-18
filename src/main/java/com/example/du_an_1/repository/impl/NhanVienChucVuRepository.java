package com.example.du_an_1.repository.impl;

import com.example.du_an_1.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
@Repository
public interface NhanVienChucVuRepository extends JpaRepository<NhanVien,Integer> {
}
