package com.example.du_an_1.entity;


import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "chitietsp")
public class ChiTietSP {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String ma;
    private String ten;
    private String mota;
    private int  soluongton;
    private BigDecimal giaNhap;
    private BigDecimal giaBan;
//    @ManyToOne
//    @JoinColumn(name = "idchatlieu")
//    private ChatLieu chatLieu;
//
//
//    @ManyToOne
//@JoinColumn(name = "idthuonghieu")
//    private  ThuongHieu thuongHieu;



}
