package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "thuonghieu")
public class ThuongHieu {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;
    private  String ma ;
    private  String ten ;
}
