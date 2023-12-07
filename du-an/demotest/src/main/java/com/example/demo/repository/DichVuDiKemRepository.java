package com.example.demo.repository;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.LoaiDichVu;
import com.example.demo.repository.impl.IDichVuDiKemRepository;
import com.example.demo.repository.impl.ILoaiDichVuRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DichVuDiKemRepository implements IDichVuDiKemRepository {
    private final ILoaiDichVuRepository loaiDichVuRepository = new LoaiDichVuRepository();
    private final String SELECT = "select * from dich_vu_di_kem;";
    private final String INSERT = "INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia_dich_vu_di_kem, id_loai_dich_vu) VALUES (?,?,?);";
    private final String UPDATE = "update dich_vu_di_kem set ten_dich_vu_di_kem = ?, gia_dich_vu_di_kem = ?, id_loai_dich_vu = ?where id_dich_vu_di_kem = ?;";
    private final String DELETE = "delete from dich_vu_di_kem where id_dich_vu_di_kem = ?;";

    @Override
    public List<DichVuDiKem> layDanhSachDichVuDiKem() {
        List<DichVuDiKem> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_dich_vu_di_kem");
                String name = resultSet.getString("ten_dich_vu_di_kem");
                double price = resultSet.getDouble("gia_dich_vu_di_kem");
                LoaiDichVu loaiDichVu = loaiDichVuRepository.findById(resultSet.getInt("id_loai_dich_vu"));
                String nameLoaiDichVu = loaiDichVu.getTenLoaiDichVu();
                list.add(new DichVuDiKem(id, name, price, loaiDichVu, nameLoaiDichVu));
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
        return list;
    }

    @Override
    public void themDichVuDiKem(DichVuDiKem dichVuDiKem) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, dichVuDiKem.getTenDichVuDiKem());
            preparedStatement.setDouble(2, dichVuDiKem.getGiaDichVuDiKem());
            preparedStatement.setInt(3, dichVuDiKem.getLoaiDichVu().getMaLoaiDichVu());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void suaDichVuDikem(DichVuDiKem dichVuDiKem) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, dichVuDiKem.getTenDichVuDiKem());
            preparedStatement.setDouble(2, dichVuDiKem.getGiaDichVuDiKem());
            preparedStatement.setInt(3, dichVuDiKem.getLoaiDichVu().getMaLoaiDichVu());
            preparedStatement.setInt(4, dichVuDiKem.getMaDichVuDiKem());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void xoaDichVuDiKem(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
