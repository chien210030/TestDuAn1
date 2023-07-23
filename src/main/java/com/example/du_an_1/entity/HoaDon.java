package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "hoadon")

public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;

    @JoinColumn(name="ma")
    private  String ma ;

    @JoinColumn(name = "ngaytao")
    private Date ngaytao;

    @JoinColumn(name = "ngaythanhtoan")
    private  Date ngaythanhtoan;

    @JoinColumn(name = "trangthai")
    private int trangthai;

    @JoinColumn(name = "ghichu")
    private  String ghichu ;

    @JoinColumn(name = "tongtien")
    private BigDecimal tongtien ;

    @JoinColumn(name = "tongtienkm")
    private BigDecimal tongtienKM ;

    @JoinColumn(name = "tongtientt")
    private  BigDecimal tongtienTT;

    @ManyToOne
    @JoinColumn(name = "idkhachhang")
    private KhachHang khachhang;

    @ManyToOne
    @JoinColumn(name = "idnhanvien")
    private  NhanVien nhanVien ;
}
