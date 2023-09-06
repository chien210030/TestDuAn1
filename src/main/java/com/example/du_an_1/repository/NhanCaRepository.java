package com.example.du_an_1.repository;

import com.example.du_an_1.entity.Ca;
import com.example.du_an_1.entity.NhanCa;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface NhanCaRepository extends JpaRepository<NhanCa, UUID> {


    @Query("SELECT s FROM Ca s")
    List<Ca> findAllCa();

//    @Query("SELECT SUM(d.tongTienCanThanhToan) FROM NhanCa nc JOIN nc.ca c JOIN nc.hoaDonList  d WHERE c.id = :shiftId")
//    BigDecimal calculateTotalTienCa(@Param("shiftId") UUID shiftId);

    @Query("SELECT SUM(d.tongtientt) FROM NhanCa nc JOIN nc.ca c JOIN nc.hoaDonList d WHERE c.id = :shiftId AND nc.ngayLam = :ngayLam AND d.trangthai = 1")
    BigDecimal calculateTotalTienCa(@Param("shiftId") UUID shiftId, @Param("ngayLam") LocalDate ngayLam);

    NhanCa findByCaAndNgayLam(Ca ca, LocalDate ngayLam);


    @Query("SELECT CONCAT(n.nhanVien.ho, ' ', n.nhanVien.tendem, ' ', n.nhanVien.ten), n.ngayLam, n.ca.tenCa, COUNT(h) , SUM(h.tongtientt)" +
            "FROM NhanCa n " +
            "LEFT JOIN n.hoaDonList h ON h.trangthai = 1 " +
            "GROUP BY CONCAT(n.nhanVien.ho, ' ', n.nhanVien.tendem, ' ', n.nhanVien.ten), n.ngayLam, n.ca.tenCa " +
            "ORDER BY n.ngayLam DESC")
    Page<Object[]> getNhanCaAll(Pageable pageable);

    @Query("SELECT CONCAT(n.nhanVien.ho, ' ', n.nhanVien.tendem, ' ', n.nhanVien.ten), n.ngayLam, n.ca.tenCa,COUNT(h), SUM(h.tongtientt) " +
            "FROM NhanCa n " +
            "LEFT JOIN n.hoaDonList h ON h.trangthai = 1 " +
            "WHERE n.nhanVien.ten LIKE %:searchQuery% OR n.nhanVien.tendem LIKE %:searchQuery% OR n.nhanVien.ho LIKE %:searchQuery%" +
            "GROUP BY CONCAT(n.nhanVien.ho, ' ', n.nhanVien.tendem, ' ', n.nhanVien.ten), n.ngayLam, n.ca.tenCa " +
            "ORDER BY n.ngayLam DESC")
    Page<Object[]> findBySearchQuery(@Param("searchQuery") String searchQuery,Pageable pageable);


}
