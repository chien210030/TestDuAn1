package com.example.du_an_1.Service;

import com.example.du_an_1.entity.ChiTietSP;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ChiTIetService {
 Page<ChiTietSP> getall(Pageable pageable);

}
