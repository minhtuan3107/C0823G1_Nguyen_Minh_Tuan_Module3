package com.example.duan.service.impl;

import com.example.duan.model.BangSuDung;
import com.example.duan.model.MayTinh;
import java.time.LocalDateTime;
import java.util.List;

public interface IMayTinhService {
  List<MayTinh> getListMayTinh();

  MayTinh getComputer(int id);

  int startTimeComputer(BangSuDung bangSuDung);

  void endTimeComputer(BangSuDung bangSuDung);

  List<BangSuDung> getListAreRental();

  List<MayTinh> listNotRental();

  int getIdSuDung(int idMay);

  List<BangSuDung> historyRental(int idMay);

  void setConfirmationPayment(int idSuDung);
}