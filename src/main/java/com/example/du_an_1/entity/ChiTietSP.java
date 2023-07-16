package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "chitietsp")
public class ChiTietSP {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     private Integer id ;
//    private String ma;
//    private String ten;

    private String mota;

    private int soluongton;

    private BigDecimal gianhap;
    private BigDecimal giaban;
    @ManyToOne
    @JoinColumn(name = "idchatlieu")
    private ChatLieu chatlieu;


    @ManyToOne
    @JoinColumn(name = "idthuonghieu")
    private ThuongHieu thuonghieu;
    @ManyToOne
    @JoinColumn(name = "idkichco")
    private KichCo kichco;

    @ManyToOne
    @JoinColumn(name = "idmausac")
    private MauSac mausac;
    @ManyToOne
    @JoinColumn(name = "idnsx")
    private NSX nsx;
    @ManyToOne
    @JoinColumn(name = "idsanpham")
    private  SanPham sanpham;

    @ManyToOne
    @JoinColumn(name = "iddongsp")
    private  DongSP dongsp;










}
