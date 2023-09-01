package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Builder
@Table(name = "hoadon")

public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private UUID id;

    @Column(name="ma")
    private  String ma;

    @Column(name = "ngaytao")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngaytao;

    @Column(name = "ngaythanhtoan")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private  Date ngaythanhtoan;

    @Column(name = "trangthai")
    private int trangthai;

    @Column(name = "ghichu")
    private  String ghichu ;

    @Column(name = "tongtien")
    private BigDecimal tongtien ;

    @Column(name = "tongtienkhuyenmai")
    private BigDecimal tongtienkm;

    @Column(name = "tongtiencanthanhtoan")
    private  BigDecimal tongtientt;

    @Column(name = "tienkhachhangtra")
    private  BigDecimal tienkhachhangtra;

    @ManyToOne
    @JoinColumn(name = "idkhachhang")
    private KhachHang khachhang;

    @ManyToOne
    @JoinColumn(name = "idnhanvien")
    private  NhanVien nhanVien ;

<<<<<<< HEAD
    @ManyToOne
    @JoinColumn(name = "idkhuyenmai")
    private KhuyenMai khuyenMai;
=======
>>>>>>> 6c30ec16a70188ab669d8506e98859b7b8aa6e79

//    @ManyToOne
//    @JoinColumn(name = "idnhanca")
//    private NhanCa nhanCa;


    @OneToMany(mappedBy = "hoadon")
    private List<HoaDonChiTiet> hoaDonChiTiets ;
    @PrePersist
    public   void generateMa(){
        this.ma = "HD" + UUID.randomUUID().toString().substring(0,6).toUpperCase();

    }


}
