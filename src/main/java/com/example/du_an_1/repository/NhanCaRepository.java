//package com.example.du_an_1.repository;
//
//import com.example.du_an_1.entity.Ca;
//import com.example.du_an_1.entity.NhanCa;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//import org.springframework.stereotype.Repository;
//
//import java.math.BigDecimal;
//import java.time.LocalDate;
//import java.util.List;
//import java.util.UUID;
//
//@Repository
//public interface NhanCaRepository extends JpaRepository<NhanCa, UUID> {
//
//
//    @Query("SELECT s FROM Ca s")
//    List<Ca> findAllCa();
//
////    @Query("SELECT SUM(d.tongTienCanThanhToan) FROM NhanCa nc JOIN nc.ca c JOIN nc.hoaDonList  d WHERE c.id = :shiftId")
////    BigDecimal calculateTotalTienCa(@Param("shiftId") UUID shiftId);
//
//    @Query("SELECT SUM(d.tongtientt) FROM NhanCa nc JOIN nc.ca c JOIN nc.hoaDonList d WHERE c.id = :shiftId AND nc.ngayLam = :ngayLam")
//    BigDecimal calculateTotalTienCa(@Param("shiftId") UUID shiftId, @Param("ngayLam") LocalDate ngayLam);
//
//    NhanCa findByCaAndNgayLam(Ca ca, LocalDate ngayLam);
//}
