package com.example.du_an_1.repository;

import com.example.du_an_1.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, UUID> {

   // List<HoaDonChiTiet> findByHoaDonMa(String maHD);
    @Query("SELECT hdct.id, " +
            "SUM(hdct.soluong), SUM(hdct.dongia * hdct.soluong), SUM(hdct.chiTietSP.giaban * hdct.soluong)" +
            "FROM HoaDonChiTiet hdct " +
            "JOIN hdct.hoadon hd " +
            "WHERE FUNCTION('MONTH', hd.ngaythanhtoan) = :month AND FUNCTION('YEAR', hd.ngaythanhtoan) = :year AND hd.trangthai = :trangthai " +
            "GROUP BY hdct.id")
    List<Object[]> getListThongKeSP(@Param("trangthai") int trangthai, @Param("year") int year, @Param("month") int month);


    //thong ke

    @Query("SELECT FUNCTION('MONTH',hd.ngaythanhtoan) as month, SUM(h.soluong) as totalSoLuong " +
            "FROM HoaDonChiTiet h " +
            "INNER JOIN h.hoadon hd " +
            "WHERE FUNCTION('YEAR',hd.ngaythanhtoan) = :year AND hd.trangthai = 1" +
            "GROUP BY FUNCTION('MONTH',hd.ngaythanhtoan)")
    List<Object[]> getTongSoLuongByNam(@Param("year") int year);
//thong ke

 @Query("SELECT h.chiTietSP, SUM(h.soluong) AS totalSold "
         + "FROM HoaDonChiTiet h "+
         "INNER JOIN h.hoadon hd "
         + "WHERE hd.trangthai = 1"
         + "GROUP BY h.chiTietSP "
         + "ORDER BY totalSold DESC")
 List<Object[]> findTop5BestSellingProducts();

}
