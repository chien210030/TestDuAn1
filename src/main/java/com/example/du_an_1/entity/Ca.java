package com.example.du_an_1.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "ca")
public class Ca {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private UUID id ;
    @Column(name = "ma")
    private String ma ;
    @Column(name = "loaica")
    private  String loaica;
    @Column(name = "ngay")
    private LocalDate ngay;
    @Column(name = "batdau")
    private LocalDate batdau;
    @Column(name = "keythuc")
    private LocalDate ketthuc;
    @Column(name = "soluong")
    private  Integer soluong;
    @Column(name = "tongdoanhthu")
    private  String tongdoanhthu;

}
