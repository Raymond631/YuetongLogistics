package cn.tdsmy.fleet.mapper;

import cn.tdsmy.fleet.beans.Truck;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TruckMapper {
    void insertTruck(Truck truck);

    void deleteTruck(@Param("truckId") int truckId);

    List<Truck> selectTruckList();

    List<Truck> selectBindTruckList();

    List<Truck> selectUnbindTruckList();
}
