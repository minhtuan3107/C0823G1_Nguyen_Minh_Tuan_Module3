package com.example.du_an.repository;

import com.example.du_an.model.TinhTrang;
import com.example.du_an.repository.impl.ITinhTrangRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TinhTrangRepository implements ITinhTrangRepository {
    private final String SELECT_TINH_TRANG = "select * from tinh_trang;";

    @Override
    public List<TinhTrang> getListTinhTrang() {
        List<TinhTrang>tinhTrangList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_TINH_TRANG);
            int idTinhTrang;
            String nameTinhTrang;
            while (resultSet.next()){
                idTinhTrang = resultSet.getInt("ma_tinh_trang");
                nameTinhTrang = resultSet.getString("ten_tinh_trang");
                tinhTrangList.add(new TinhTrang(idTinhTrang,nameTinhTrang));
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
        return tinhTrangList;
    }
}
