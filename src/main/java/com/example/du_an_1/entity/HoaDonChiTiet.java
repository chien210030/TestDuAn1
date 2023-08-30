package com.example.du_an_1.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Builder
@Table(name = "hoadonchitiet")

public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;

    @ManyToOne
    @JoinColumn(name = "idhoadon")
    private HoaDon hoadon;

    @ManyToOne
    @JoinColumn(name = "idchitietsanpham")
    private ChiTietSP chiTietSP;

    @JoinColumn(name = "soluong")
    private int soluong;

    @JoinColumn(name = "dongia")
    private BigDecimal dongia;

    @Override
    public String toString() {
        return "HoaDonChiTiet{" +
                "id=" + id +
//                ", hoadon=" + hoadon +
                ", chiTietSP=" + chiTietSP +
                ", soluong=" + soluong +
                ", dongia=" + dongia +
                '}';
    }
}
