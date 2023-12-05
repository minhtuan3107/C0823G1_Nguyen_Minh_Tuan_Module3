package com.example.du_an.service;

import com.example.du_an.model.MayTinh;
import com.example.du_an.repository.MayTinhRepository;
import com.example.du_an.repository.impl.IMayTinhRepository;
import com.example.du_an.service.impl.IMayTinhService;

import java.util.List;

public class MayTinhService implements IMayTinhService {
    private final IMayTinhRepository mayTinhRepository = new MayTinhRepository();

    @Override
    public List<MayTinh> getListMayTinh() {
        return mayTinhRepository.getListMayTinh();
    }
}
