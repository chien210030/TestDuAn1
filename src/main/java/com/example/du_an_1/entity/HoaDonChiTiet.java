package com.example.du_an_1.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "hoadonchitiet")

public class HoaDonChiTiet {
    @Id
    @ManyToOne
    @JoinColumn(name = "idhoadon")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "idchitietsanpham")
    private ChiTietSP chiTietSP;

    private int soLuong;
    private BigDecimal donGia;
}
