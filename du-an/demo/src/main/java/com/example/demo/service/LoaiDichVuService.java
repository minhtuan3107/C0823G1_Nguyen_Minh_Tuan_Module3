package com.example.demo.service;

import com.example.demo.model.LoaiDichVu;
import com.example.demo.repository.impl.ILoaiDichVuRepository;
import com.example.demo.repository.LoaiDichVuRepository;

import java.util.List;

public class LoaiDichVuService implements ILoaiDichVuService{
    private final ILoaiDichVuRepository loaiDichVuRepository = new LoaiDichVuRepository();

    @Override
    public List<LoaiDichVu> layDanhSachLoaiDichVu() {
        return loaiDichVuRepository.layDanhSachLoaiDichVu();
    }

    @Override
    public void themLoaiDichVu(LoaiDichVu loaiDichVu) {
            loaiDichVuRepository.themLoaiDichVu(loaiDichVu);
    }

    @Override
    public void suaLoaiDichVu(LoaiDichVu loaiDichVu) {
            loaiDichVuRepository.suaLoaiDichVu(loaiDichVu);
    }

    @Override
    public void xoaLoaiDichVu(int id) {
            loaiDichVuRepository.xoaLoaiDichVu(id);
    }
}
