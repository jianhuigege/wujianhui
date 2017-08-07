package com.springmvc.service;

import com.springmvc.dao.ToyMapper;
import com.springmvc.pojo.Toy;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service("toyService")
@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
public class ToyService {

    @Resource(name = "toyMapper")
    private ToyMapper toyMapper;

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public Integer add(Toy toy) {
        return toyMapper.add(toy);
    }


    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public Integer modify(Toy toy) {
        return toyMapper.modify(toy);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public Integer remove(Integer id) {
        return toyMapper.remove(id);
    }

    public List<Toy> findByParam(String name,Date beginDate,Date endDate) {
        return toyMapper.findByParam(name, beginDate, endDate);
    }

    public Toy findById(Integer id) {
    	return toyMapper.findById(id);
    }
}
