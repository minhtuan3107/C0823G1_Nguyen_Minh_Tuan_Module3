package com.example.duan.repository.impl;

import com.example.duan.model.DichVuDiKem;
import com.example.duan.model.LoaiDichVu;
import com.example.duan.model.SuDungChiTiet;
import java.util.List;

public interface IDichVuRepository {

  List<DichVuDiKem> getListDichVu();

  void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity);

  List<SuDungChiTiet> getListUsed(int idSuDung);
}
