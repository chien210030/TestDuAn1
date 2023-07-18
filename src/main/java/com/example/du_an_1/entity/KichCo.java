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
@Table(name = "kichco")
public class KichCo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;

    private String ma ;

    private String ten ;
}
