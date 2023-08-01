package com.example.du_an_1.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "hoadonchitiet")

public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;

    @ManyToOne
    @JoinColumn(name = "idhoadon")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "idchitietsanpham")
    private ChiTietSP chiTietSP;

    private int soLuong;
    private BigDecimal donGia;
}
