package com.example.du_an.model;

import java.time.LocalDate;

public class BangSuDung {
    private int idBangSuDung;
    private LocalDate gioBatDau;
    private LocalDate gioKetThuc;
    private MayTinh maMayTinh;
    private NhanVien maNhanVien;

    public BangSuDung(int idBangSuDung, LocalDate gioBatDau, LocalDate gioKetThuc, MayTinh maMayTinh, NhanVien maNhanVien) {
        this.idBangSuDung = idBangSuDung;
        this.gioBatDau = gioBatDau;
        this.gioKetThuc = gioKetThuc;
        this.maMayTinh = maMayTinh;
        this.maNhanVien = maNhanVien;
    }

    public BangSuDung(LocalDate gioBatDau, LocalDate gioKetThuc, MayTinh maMayTinh, NhanVien maNhanVien) {
        this.gioBatDau = gioBatDau;
        this.gioKetThuc = gioKetThuc;
        this.maMayTinh = maMayTinh;
        this.maNhanVien = maNhanVien;
    }

    public int getIdBangSuDung() {
        return idBangSuDung;
    }

    public void setIdBangSuDung(int idBangSuDung) {
        this.idBangSuDung = idBangSuDung;
    }

    public LocalDate getGioBatDau() {
        return gioBatDau;
    }

    public void setGioBatDau(LocalDate gioBatDau) {
        this.gioBatDau = gioBatDau;
    }

    public LocalDate getGioKetThuc() {
        return gioKetThuc;
    }

    public void setGioKetThuc(LocalDate gioKetThuc) {
        this.gioKetThuc = gioKetThuc;
    }

    public MayTinh getMaMayTinh() {
        return maMayTinh;
    }

    public void setMaMayTinh(MayTinh maMayTinh) {
        this.maMayTinh = maMayTinh;
    }

    public NhanVien getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(NhanVien maNhanVien) {
        this.maNhanVien = maNhanVien;
    }
}
