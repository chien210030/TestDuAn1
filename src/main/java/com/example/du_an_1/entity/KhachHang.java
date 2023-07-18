package com.example.du_an_1.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private UUID id ;

    @Column(name = "Ten")
    @NotBlank(message = "Không được để trống tên !")
    private String ten ;

    @Column(name = "TenDem")
    @NotBlank(message = "Không được để trống tên đệm !")
    private String tendem ;

    @Column(name = "Ho")
    @NotBlank(message = "Không được để trống họ !")
    private String ho ;

    @Column(name = "GioiTinh")
    @NotNull(message = "Chọn giới tính !")
    private  Boolean gioitinh ;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgaySinh")
    Date ngaysinh = new Date();

    @Column(name = "Email")
    @NotBlank(message = "Không được để trống email !")
    @Email(message = "Email không đúng định dạng !")
    private String email ;

    @Column(name = "Sdt")
    @NotBlank(message = "Không được để trống sdt !")
    private String sdt ;

    @Column(name = "DiemThuong")
    @NotNull(message = "Không được để trống điểm thưởng !")
    private int diemthuong;

    @OneToMany(mappedBy = "KhachHang")
    List<HoaDon> hoadon;
}
