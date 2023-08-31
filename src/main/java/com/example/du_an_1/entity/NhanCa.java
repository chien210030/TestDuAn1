//package com.example.du_an_1.entity;
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.JoinColumn;
//import jakarta.persistence.ManyToOne;
//import jakarta.persistence.OneToMany;
//import jakarta.persistence.Table;
//import lombok.Data;
//
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.util.List;
//import java.util.UUID;
//
//@Entity
//@Data
//@Table(name = "nhanca")
//public class NhanCa {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//
//    private UUID id ;
//
//    @Column(name = "thoi_gian_bat_dau")
//    private LocalDateTime thoiGianBatDau;
//
//    @Column(name = "thoi_gian_ket_thuc")
//    private LocalDateTime  thoiGianKetThuc;
//
//    @Column(name = "NgayLam")
//    private LocalDate ngayLam;
//
//
//    @ManyToOne
//    @JoinColumn(name = "IdNhanVien")
//    private NhanVien nhanVien;
//
//    @ManyToOne
//    @JoinColumn(name = "IdCa")
//    private Ca ca;
//
//    @OneToMany(mappedBy = "nhanCa")
//    private List<HoaDon> hoaDonList;
//
//
//}
