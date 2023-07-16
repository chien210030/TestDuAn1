package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "HoaDon")

public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id ;

    @JoinColumn(name="ma")
    private  String ma ;

    @JoinColumn(name = "NgayTao")
    private Date ngaytao ;

    @JoinColumn(name = "NgayThanhToan")
    private  Date ngaythanhtoan ;

    @JoinColumn(name = "TrangThai")
    private int trangthai;

    @JoinColumn(name = "GhiChu")
    private  String ghichu ;

    @JoinColumn(name = "TongTien")
    private BigDecimal tongtien ;

    @JoinColumn(name = "TongTienKm")
    private BigDecimal tongtienKM ;

    @JoinColumn(name = "TongTienTT")
    private  BigDecimal tongtienTT;

    @ManyToOne
    @JoinColumn(name = "idkhachhang")
    private KhachHang khachhang;

    @ManyToOne
    @JoinColumn(name = "idnhanvien")
    private  NhanVien nhanVien ;


}
