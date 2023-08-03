package com.example.du_an_1.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

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

    @Column(name="ma")
    private  String ma ;

    @Column(name = "ngaytao")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngaytao;

    @Column(name = "ngaythanhtoan")
    @Temporal(TemporalType.DATE)
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

    @PrePersist
    private  void generateMa(){
        this.ma = "HD" + UUID.randomUUID().toString().substring(0,6).toUpperCase();

    }
}
