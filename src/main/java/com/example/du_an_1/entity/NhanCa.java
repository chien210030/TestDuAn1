package com.example.du_an_1.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Data

public class NhanCa {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    private UUID id ;

    @Column(name = "ThoiGianBatDau")
    private LocalDateTime thoiGianBatDau;

    @Column(name = "ThoiGianKetThuc")
    private LocalDateTime  thoiGianKetThuc;

    @Column(name = "NgayLam")
    private LocalDate ngayLam;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdNhanVien")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "IdCa")
    private Ca ca;

    @OneToMany(mappedBy = "nhanCa", fetch = FetchType.LAZY)
    private List<HoaDon> hoaDonList;

    @Override
    public String toString() {
        return "NhanCa{" +
                "id=" + id +
                ", thoiGianBatDau=" + thoiGianBatDau +
                ", thoiGianKetThuc=" + thoiGianKetThuc +
                ", ngayLam=" + ngayLam +
                // Biểu diễn các mối quan hệ trong toString()
                ", nhanVien=" + nhanVien +
                ", ca=" + ca +
                // Nếu cần, bạn có thể biểu diễn các danh sách OneToMany ở đây
                '}';
    }
}
