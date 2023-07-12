package cn.tdsmy.transport.mapper;

import cn.tdsmy.transport.beans.Cost;
import cn.tdsmy.transport.beans.vo.CostQueryVO;
import cn.tdsmy.transport.beans.vo.CostVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CostMapper {
    List<CostQueryVO> selectCarriers();

    void updateCost(@Param("cost") Cost cost, @Param("totalCost") double totalCost);

    List<CostVO> selectCost();

    void updateCarrierStatus(@Param("carrierId") int carrierId);
}
