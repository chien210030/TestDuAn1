package com.example.du_an_1.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TongTienCa {

    private String tenCa;
    private BigDecimal totalTien;
}
