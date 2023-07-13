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
@Table(name = "khachhang")
public class KhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id ;

    private String ma ;
    private String ten ;
    private String tendem ;
    private String ho ;
    private  int gioitinh ;
    private Date ngaysinh;
    private String email ;
        private String sdt ;
        private int diemthuong;


}
