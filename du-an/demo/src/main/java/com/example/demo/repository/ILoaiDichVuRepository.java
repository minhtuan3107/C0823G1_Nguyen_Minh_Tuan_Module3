package com.example.demo.repository;

import com.example.demo.model.LoaiDichVu;

import java.util.List;

public interface ILoaiDichVuRepository {
    List<LoaiDichVu> layDanhSachLoaiDichVu();

    void themLoaiDichVu(LoaiDichVu loaiDichVu);

    void suaLoaiDichVu(LoaiDichVu loaiDichVu);

    void xoaLoaiDichVu(int id);
}
