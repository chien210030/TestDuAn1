package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "nhanvien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  Integer id ;

    private String ma ;
    private  String ten;
    private String tendem ;
    private String ho;
    private Date    ngaysinh;
    private int gioitinh ;
    private String sdt ;
    private String taikhoan;
    private String matkhau ;
    private String email ;
    private  int trangthai ;

@ManyToOne
    @JoinColumn(name = "idchucvu")
    private ChucVu chucVu;




}
