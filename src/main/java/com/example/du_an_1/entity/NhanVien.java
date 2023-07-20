package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Builder
@Table(name = "nhanvien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;
    private String ma;
    private  String ten;
    private String tendem ;
    private String ho;
    private LocalDate ngaysinh;
    private Integer gioitinh;
    private String sdt ;
    private String taikhoan;
    private String matkhau ;
    private String email ;
    private  Integer trangthai ;

    @ManyToOne
    @JoinColumn(name = "idchucvu")
    ChucVu chucVu;
}
