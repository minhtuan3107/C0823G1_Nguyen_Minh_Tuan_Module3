package com.example.du_an.repository;

import com.example.du_an.model.MayTinh;
import com.example.du_an.model.TinhTrang;
import com.example.du_an.repository.impl.IMayTinhRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MayTinhRepository implements IMayTinhRepository {
    private final String SELECT_MAY_TINH = "select mt.ma_may_tinh,mt.ten_may_tinh,mt.ram, mt.chip,mt.hang,ttct.mo_ta_tinh_trang,mt.is_delete from may_tinh mt join tinh_trang_chi_tiet ttct on mt.ma_tinh_trang = ttct.ma_tinh_trang;";

    @Override
    public List<MayTinh> getListMayTinh() {
        List<MayTinh> mayTinhList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_MAY_TINH);
            while (resultSet.next()) {
                int idMayTinh = resultSet.getInt("ma_may_tinh");
                String tenMayTinh = resultSet.getString("ten_may_tinh");
                String ramMayTinh = resultSet.getString("ram");
                String chip = resultSet.getString("chip");
                String hang = resultSet.getString("hang");
                String tenTinhTrang = resultSet.getString("ten_tinh_trang");
                Boolean isDelete = resultSet.getBoolean("is_delete");
                mayTinhList.add(new MayTinh(idMayTinh, tenMayTinh, ramMayTinh, chip, hang, new TinhTrang(tenTinhTrang), isDelete));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                statement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mayTinhList;
    }
}
