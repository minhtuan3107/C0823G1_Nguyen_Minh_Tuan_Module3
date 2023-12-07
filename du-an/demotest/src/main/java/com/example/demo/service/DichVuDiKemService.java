package com.example.demo.service;

import com.example.demo.model.DichVuDiKem;

import java.util.List;

public class DichVuDiKemService implements IDichVuDiKemService{
    private final IDichVuDiKemService dichVuDiKemService = new DichVuDiKemService();
    @Override
    public List<DichVuDiKem> layDanhSachDichVuDiKem() {
        return dichVuDiKemService.layDanhSachDichVuDiKem();
    }

    @Override
    public void themDichVuDiKem(DichVuDiKem dichVuDiKem) {
        dichVuDiKemService.themDichVuDiKem(dichVuDiKem);
    }

    @Override
    public void suaDichVuDikem(DichVuDiKem dichVuDiKem) {
        dichVuDiKemService.suaDichVuDikem(dichVuDiKem);
    }

    @Override
    public void xoaDichVuDiKem(int id) {
        dichVuDiKemService.xoaDichVuDiKem(id);
    }
}
