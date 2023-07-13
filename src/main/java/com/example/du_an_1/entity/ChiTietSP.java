package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "chitietsp")
public class ChiTietSP {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String ma;
    private String ten;
    private String mota;
    private int soluongton;
    private BigDecimal giaNhap;
    private BigDecimal giaBan;
    @ManyToOne
    @JoinColumn(name = "idchatlieu")
    private ChatLieu chatLieu;


    @ManyToOne
    @JoinColumn(name = "idthuonghieu")
    private ThuongHieu thuongHieu;
    @ManyToOne
    @JoinColumn(name = "idkichco")
    private KichCo kichCo;

    @ManyToOne
    @JoinColumn(name = "idmausac")
    private MauSac mauSac;
    @ManyToOne
    @JoinColumn(name = "idnsx")
    private NSX nsx;
    @ManyToOne
    @JoinColumn(name = "idsanpham")
    private  SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "iddongsp")
    private  DongSP dongSP;










}
