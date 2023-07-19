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
@Builder
@Table(name = "users")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id ;
    private  String ten;
    private String tendem ;
    private String ho;
    private LocalDate ngaysinh;
    @Column(name = "gioitinh")
    private Boolean GioiTinh ;
    private String sdt ;
    private String taikhoan;
    private String matkhau ;
    private String email ;
    private  Integer trangthai ;

    @ManyToOne
    @JoinColumn(name = "idcv")
    ChucVu chucVu;
}
