package cn.tdsmy.fleet.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ContactMapper {
    void insertContact(@Param("truckId") int truckId, @Param("driverId") int driverId);

    void deleteContact(@Param("contactId") int contactId);
}
