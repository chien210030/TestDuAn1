package com.example.du_an_1.repository;

import com.example.du_an_1.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface HoaDonRepository extends JpaRepository<HoaDon , UUID> {
    //thong ke
    @Query("SELECT FUNCTION('MONTH', hd.ngaythanhtoan) as month, COUNT(hd) as totalDonHang " +
            "FROM HoaDon hd " +
            "WHERE FUNCTION('YEAR', hd.ngaythanhtoan) = :year AND hd.trangthai = 1" +
            "GROUP BY FUNCTION('MONTH', hd.ngaythanhtoan)")
    List<Object[]> getTongDonHangByNam(@Param("year") int year);
//thong ke

    @Query("SELECT FUNCTION('MONTH', hd.ngaythanhtoan) as month, SUM(hd.tongtientt) as totalTien " +
            "FROM HoaDon hd " +
            "WHERE FUNCTION('YEAR', hd.ngaythanhtoan) = :year AND hd.trangthai = 1" +
            "GROUP BY FUNCTION('MONTH', hd.ngaythanhtoan)")
    List<Object[]> getTongTienCanThanhToanByNam(@Param("year") int year);

}
