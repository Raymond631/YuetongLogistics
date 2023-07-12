package cn.tdsmy.transport.service;

import cn.tdsmy.transport.beans.Carrier;
import cn.tdsmy.transport.beans.Goods;
import cn.tdsmy.transport.beans.vo.CarrierAndDriver;
import cn.tdsmy.transport.mapper.CarrierMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CarrierService {
    @Autowired
    private CarrierMapper carrierMapper;

    public void newCarrier(Carrier carrier) {
        carrierMapper.addCarriers(carrier);
        for (Goods goods : carrier.getGoodsList()) {
            // 插入框架返回的自增主键
            goods.setFkCarriersId(carrier.getCarriersId());
            carrierMapper.insertGoods(goods);
        }
    }

    public void updateCarrier(int carrierId, Date receiveDate, int finishedState) {
        carrierMapper.updateCarrier(carrierId, receiveDate, finishedState);
    }

    public List<CarrierAndDriver> getCarriers(String account) {
        return carrierMapper.searchCarriers(account);
    }
}
