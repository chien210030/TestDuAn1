package com.example.du_an_1.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Integer id ;

    @NotBlank(message = "Không được để trống tên !")
    private String ten ;

    @NotBlank(message = "Không được để trống tên đệm !")
    private String tendem ;

    @NotBlank(message = "Không được để trống họ !")
    private String ho ;

    @NotNull(message = "Chọn giới tính !")
    private  Boolean gioitinh ;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngaysinh")
    Date ngaysinh = new Date();

    @NotBlank(message = "Không được để trống email !")
    @Email(message = "Email không đúng định dạng !")
    private String email ;

    @NotBlank(message = "Không được để trống sdt !")
    private String sdt ;

    @NotNull(message = "Không được để trống điểm thưởng !")
    private int diemthuong;


    @OneToMany(mappedBy = "khachhang")
    List<HoaDon> hoadon;
}
