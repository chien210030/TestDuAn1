package com.example.du_an_1.Service;

import com.example.du_an_1.entity.SanPham;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface SanPhamService {
    public List<SanPham> getDSSP(Pageable pageable);
}
