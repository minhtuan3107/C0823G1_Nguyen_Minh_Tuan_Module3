package com.example.demo.service;

import com.example.demo.model.LoaiDichVu;

import java.util.List;

public interface ILoaiDichVuService {
    List<LoaiDichVu> layDanhSachLoaiDichVu();

    void themLoaiDichVu(LoaiDichVu loaiDichVu);

    void suaLoaiDichVu(LoaiDichVu loaiDichVu);

    void xoaLoaiDichVu(int id);

    LoaiDichVu findById(int id);

}
