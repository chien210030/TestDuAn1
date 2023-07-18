package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "sanpham")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;

    private String ma ;
    private  String ten ;


}
