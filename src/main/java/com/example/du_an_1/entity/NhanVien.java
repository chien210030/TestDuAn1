package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
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
    private Long id ;

    private String ma ;
    private  String ten;
    private String tendem ;
    private String ho;
    private LocalDate ngaysinh;
    private int gioitinh ;
    private String sdt ;
    private String taikhoan;
    private String matkhau ;
    private String email ;
    private  int trangthai ;

    @ManyToOne
    @JoinColumn(name = "idchucvu")
    ChucVu chucVu;
}
