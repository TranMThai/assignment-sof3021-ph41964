package com.sof_3021.ph41964.service.impl;

import com.sof_3021.ph41964.entity.BillDetail;
import com.sof_3021.ph41964.repository.BillDetailRepository;
import com.sof_3021.ph41964.service.BillDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillDetailServiceImpl implements BillDetailService {

    @Autowired
    BillDetailRepository billDetailRepository;

    @Override
    public List<BillDetail> getAll() {
        return billDetailRepository.findAll();
    }

    @Override
    public BillDetail getById(int id) {
        return billDetailRepository.findById(id).get();
    }

    @Override
    public void create(BillDetail billDetail) {
        billDetailRepository.save(billDetail);
    }

    @Override
    public void update(BillDetail billDetail) {
        billDetailRepository.save(billDetail);
    }

    @Override
    public void remove(int id) {
        billDetailRepository.deleteById(id);
    }

}
