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
@Table(name = "hoadon")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id ;

    private  String ma ;
    private Date ngaytao ;
    private  Date ngaythanhtoan ;
    private int trangthai;
    private  String ghichu ;
    private BigDecimal tongtien ;
    private BigDecimal tongtienKM ;
    private  BigDecimal tongtienTT;

    @ManyToOne
    @JoinColumn(name = "idkhachhang")
    private KhachHang khachhang;

    @ManyToOne
    @JoinColumn(name = "idnhanvien")
    private  NhanVien nhanVien ;


}
