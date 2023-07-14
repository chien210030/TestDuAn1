package com.example.du_an_1.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

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

    private String ten ;
    private String tendem ;
    private String ho ;
    private  Boolean gioitinh ;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngaysinh")
    Date ngaysinh = new Date();

    private String email ;
    private String sdt ;
    private int diemthuong;


    @OneToMany(mappedBy = "khachhang")
    List<HoaDon> hoadon;
}
