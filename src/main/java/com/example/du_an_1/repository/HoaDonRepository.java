package com.example.du_an_1.repository;

import com.example.du_an_1.entity.HoaDon;
import com.example.du_an_1.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.UUID;
@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon , UUID> {
    @Modifying
    @Query("update HoaDon h set h.khachhang.id =:newkh where h.id =:hoaDonId")
    void  updatekhachhang(@Param("newkh") UUID kh,@Param("hoaDonId") UUID hoadonid );

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

    // ca
    int countByTrangthaiAndNgaytao(int trangthai, Date ngaytao);

}
