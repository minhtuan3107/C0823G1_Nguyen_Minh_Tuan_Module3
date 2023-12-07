package com.example.demo.service;

import com.example.demo.model.DichVuDiKem;

import java.util.List;

public interface IDichVuDiKemService {
    List<DichVuDiKem> layDanhSachDichVuDiKem();

    void themDichVuDiKem(DichVuDiKem dichVuDiKem);

    void suaDichVuDikem(DichVuDiKem dichVuDiKem);

    void xoaDichVuDiKem(int id);

}
