package cn.tdsmy.transport.mapper;

import cn.tdsmy.transport.beans.Carrier;
import cn.tdsmy.transport.beans.Scheduling;
import cn.tdsmy.transport.beans.vo.TruckAndDriver;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    List<Carrier> selectCarriers();

    List<TruckAndDriver> selectFreeTruck();

    void insertSchedule(Scheduling scheduling);

    Integer getDriverId(@Param("truckId") int fkTruckId);

    void updateTruckStatus(@Param("truckId") int fkTruckId);

    void updateDriverStatus(@Param("driverId") int driverId);

    void updateCarrierStatus(@Param("carrierId") int fkCarriersId);
}
