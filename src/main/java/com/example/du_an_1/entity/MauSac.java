package com.example.du_an_1.entity;


import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "mausac")
public class MauSac {
@Id
 @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id ;
    private String ma ;
    private String ten ;

}
