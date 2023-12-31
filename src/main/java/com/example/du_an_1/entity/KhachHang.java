package com.example.du_an_1.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "khachhang")
public class KhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private UUID id;

    @Column(name = "ten")
    @NotBlank(message = "Không được để trống tên !")
    private String ten;

    @Column(name = "tendem")
    @NotBlank(message = "Không được để trống tên đệm !")
    private String tendem;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ho")
//    @NotBlank(message = "Không được để trống họ !")
    private String ho;

    @Column(name = "gioitinh")
//    @NotNull(message = "Chọn giới tính !")
    private Boolean gioitinh;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "ngaysinh")
    Date ngaysinh;

    @Column(name = "email")
    private String email;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "diemthuong")
    private Integer diemthuong;

    @PrePersist
    public void genmakh() {
        this.ma = "KH" + UUID.randomUUID().toString().substring(0, 2);
    }
//    @OneToMany(mappedBy = "Khachhang")
//  private   List<HoaDon> hoadon;
}
