package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "chitietsp")
public class ChiTietSP {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;
    //    private String ma;
//    private String ten;
    @JoinColumn(name = "mota")
    private String mota;
    @JoinColumn(name = "soluongton")
    private int soluongton;

    @JoinColumn(name = "giaban")
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
    private SanPham sanpham;
//    @ManyToOne
//    @JoinColumn(name = "ma")
//    private  SanPham ma;
//
//    @ManyToOne
//    @JoinColumn(name = "ten")
//    private  SanPham ten ;

    @ManyToOne
    @JoinColumn(name = "iddongsp")
    private DongSP dongsp;

    @OneToMany(mappedBy = "chiTietSP")
    private List<HoaDonChiTiet>  hoadonchitiet;

}
