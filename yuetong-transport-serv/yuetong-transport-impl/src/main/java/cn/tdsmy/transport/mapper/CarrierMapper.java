package cn.tdsmy.transport.mapper;

import cn.tdsmy.transport.beans.Carrier;
import cn.tdsmy.transport.beans.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface CarrierMapper {
    void addCarriers(Carrier carrier);

    void insertGoods(Goods goods);

    void updateCarrier(@Param("carrierId") int carrierId, @Param("receiveDate") Date receiveDate, @Param("finishedState") int finishedState);

    List<Carrier> searchCarriers(@Param("account") String account);
}
