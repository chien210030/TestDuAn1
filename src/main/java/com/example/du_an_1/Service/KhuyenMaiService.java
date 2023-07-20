package com.example.du_an_1.Service;

import com.example.du_an_1.entity.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface KhuyenMaiService {
    public KhuyenMai getByKhuyenMai(UUID id);
    public void deleteByKhuyenMai(UUID id);
    public void save(KhuyenMai khuyenMai);
    public List<KhuyenMai> getDsKhuyenMai();
    public Page<KhuyenMai> search(Date fromDate, Date toDate,UUID id, Pageable pageable);

}
