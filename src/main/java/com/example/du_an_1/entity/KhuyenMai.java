package com.example.du_an_1.entity;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "khuyenmai")
public class KhuyenMai {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @NotBlank(message = "Mã Khuyến Mãi không được trống")
    private String ma;

    @NotBlank(message = "Tên Khuyến Mãi không được trống")
    private String ten;

    @NotNull(message = "Ngày bắt đầu không được trống")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngaybatdau;

    @NotNull(message = "Ngày kết thúc không được trống")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayketthuc;

    @NotBlank(message = "Hình thức Khuyến Mãi không được trống")
    private String hinhthuckm;

    @NotNull(message = "Giá trị giảm không được trống")
    private BigDecimal giatrigiam;

    @NotBlank(message = "Trạng thái Khuyến Mãi không được trống")
    private Integer trangthai;

}
