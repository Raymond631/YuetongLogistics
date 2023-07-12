package cn.tdsmy.fleet.mapper;

import cn.tdsmy.fleet.beans.Driver;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DriverMapper {
    void insertDriver(Driver driver);

    void deleteDriver(@Param("driverId") int driverId);

    List<Driver> selectDriverList();

    List<Driver> selectBindDriverList();

    List<Driver> selectUnbindDriverList();
}
