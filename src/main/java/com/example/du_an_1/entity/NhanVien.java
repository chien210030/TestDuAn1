package com.example.du_an_1.entity;


import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Builder
@Table(name = "nhanvien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private UUID id;

    @Column(name = "ma")
    //@NotBlank(message = "Không được để chống mã")
    private String ma;

    @Column(name = "ten")
    //@NotBlank(message = "Không được để chống ten")
    private String ten;

    @Column(name = "tendem")
    //@NotBlank(message = "Không được để chống tendem")
    private String tendem;

    @Column(name = "ho")
    ///@NotBlank(message = "Không được để chống Họ")
    private String ho;

    //@NotNull(message = "Ngày bắt đầu không được trống")
    //@Temporal(TemporalType.DATE)
    //@DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ngaysinh")
    private LocalDate ngaysinh;

    @Column(name = "gioitinh")
    //@NotNull(message = "Chọn giới tính")
    private Integer gioitinh;

    @Column(name = "sdt")
    //@NotBlank(message = "Không được để chống sdt")
    private String sdt;

    @Column(name = "taikhoan")
    //@NotBlank(message = "Không được để chống TK")
    private String taikhoan;

    @Column(name = "matkhau")
    //@NotBlank(message = "Không được để chống Mk")
    private String matkhau;

    @Column(name = "email")
    //@NotBlank(message = "Không được để chống email")
   // @Email(message = "Không đúng định dạng")
    private String email;

    @Column(name = "trangthai")
    //@NotNull(message = "Chọn Trạng Thái")
    private Integer trangthai;

    @ManyToOne
    @JoinColumn(name = "idchucvu")
    ChucVu chucVu;

    @ManyToOne
    @JoinColumn(name = "idca")
    Ca ca;
}
