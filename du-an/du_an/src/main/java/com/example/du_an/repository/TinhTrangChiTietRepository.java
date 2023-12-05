package com.example.du_an.repository;

import com.example.du_an.model.TinhTrang;
import com.example.du_an.model.TinhTrangChiTiet;
import com.example.du_an.repository.impl.ITinhTrangChiTietRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TinhTrangChiTietRepository implements ITinhTrangChiTietRepository {
    private final String SELECT_TINH_TRANG_CHI_TIET = "select * from tinh_trang_chi_tiet;";

    @Override
    public List<TinhTrangChiTiet> getListTinhTrangChiTiet() {
        List<TinhTrangChiTiet>list = new ArrayList<>();
        Statement statement = null;
        Connection connection = BaseRepository.getConnection();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_TINH_TRANG_CHI_TIET);
            int idTinhTrangChiTiet;
            String moTaTinhTrangChiTiet;
            TinhTrang maTinhTrang;
            while (resultSet.next()){
                idTinhTrangChiTiet = resultSet.getInt("id_tinh_trang_chi_tiet");
                moTaTinhTrangChiTiet = resultSet.getString("mo_ta_tinh_trang");
//                maTinhTrang = resultSet.getInt("ma_tinh_trang");
//                list.add(new TinhTrangChiTiet(idTinhTrangChiTiet,moTaTinhTrangChiTiet,maTinhTrang));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                statement.close();
                connection.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return list;
    }
}
