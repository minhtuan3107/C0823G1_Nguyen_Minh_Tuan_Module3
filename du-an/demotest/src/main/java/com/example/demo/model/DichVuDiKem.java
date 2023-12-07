package com.example.demo.model;

public class DichVuDiKem {
    private int maDichVuDiKem;
    private String tenDichVuDiKem;
    private double giaDichVuDiKem;
    private LoaiDichVu loaiDichVu;
    private String tenLoaiDichVu;



    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem, LoaiDichVu loaiDichVu, String tenLoaiDichVu) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.loaiDichVu = loaiDichVu;
        this.tenLoaiDichVu = tenLoaiDichVu;
    }

    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem, String tenLoaiDichVu) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.tenLoaiDichVu = tenLoaiDichVu;
    }

    public String getTenLoaiDichVu() {
        return tenLoaiDichVu;
    }
    public void setTenLoaiDichVu(String tenLoaiDichVu) {
        this.tenLoaiDichVu = tenLoaiDichVu;
    }

    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
    }


    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem, LoaiDichVu loaiDichVu) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.loaiDichVu = loaiDichVu;
    }


    public DichVuDiKem() {
    }

    public DichVuDiKem(int maDichVuDiKem) {
        this.maDichVuDiKem = maDichVuDiKem;
    }

    public DichVuDiKem(String tenDichVuDiKem, double giaDichVuDiKem, LoaiDichVu loaiDichVu) {
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.loaiDichVu = loaiDichVu;
    }

    public DichVuDiKem(String tenDichVuDiKem, double giaDichVuDiKem) {
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
    }

    public int getMaDichVuDiKem() {
        return maDichVuDiKem;
    }

    public void setMaDichVuDiKem(int maDichVuDiKem) {
        this.maDichVuDiKem = maDichVuDiKem;
    }

    public String getTenDichVuDiKem() {
        return tenDichVuDiKem;
    }

    public void setTenDichVuDiKem(String tenDichVuDiKem) {
        this.tenDichVuDiKem = tenDichVuDiKem;
    }

    public double getGiaDichVuDiKem() {
        return giaDichVuDiKem;
    }
    public void setGiaDichVuDiKem(double giaDichVuDiKem) {
        this.giaDichVuDiKem = giaDichVuDiKem;
    }

    public LoaiDichVu getLoaiDichVu() {
        return loaiDichVu;
    }

    public void setLoaiDichVu(LoaiDichVu loaiDichVu) {
        this.loaiDichVu = loaiDichVu;
    }
}
