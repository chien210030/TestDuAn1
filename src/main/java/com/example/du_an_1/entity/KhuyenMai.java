package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "khuyenmai")
public class KhuyenMai {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String ma;
    private String ten;

    private Date ngaybatdau;
    private Date ngayketthuc;
    private String hinhthuckm;
    private BigDecimal giatrigiam;
    private int trangthai;

}
