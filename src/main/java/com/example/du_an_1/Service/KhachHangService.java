package com.example.du_an_1.Service;

import com.example.du_an_1.entity.KhachHang;

import java.util.List;

public interface KhachHangService {

    List<KhachHang> getall();

    KhachHang getsdt(String sdt);
    KhachHang add(KhachHang kh);
}
