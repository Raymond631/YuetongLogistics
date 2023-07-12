package cn.tdsmy.transport.service;

import cn.tdsmy.transport.beans.Cost;
import cn.tdsmy.transport.beans.vo.CostQueryVO;
import cn.tdsmy.transport.beans.vo.CostVO;
import cn.tdsmy.transport.mapper.CostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CostService {
    @Autowired
    private CostMapper costMapper;

    public List<CostQueryVO> getCarriers() {
        return costMapper.selectCarriers();
    }

    public void addCost(Cost cost) {
        double totalCost = cost.getOilCost() + cost.getFine() + cost.getToll() + cost.getOtherCost();
        costMapper.updateCost(cost, totalCost);
        costMapper.updateCarrierStatus(cost.getCarrierId());
    }

    public List<CostVO> getCost() {
        return costMapper.selectCost();
    }
}
