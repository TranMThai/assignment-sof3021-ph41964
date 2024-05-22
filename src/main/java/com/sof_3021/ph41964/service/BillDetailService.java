package com.sof_3021.ph41964.service;

import com.sof_3021.ph41964.entity.BillDetail;

import java.util.List;

public interface BillDetailService {
    List<BillDetail> getAll();

    BillDetail getById(int id);

    void create(BillDetail billDetail);

    void update(BillDetail billDetail);

    void remove(int id);
}