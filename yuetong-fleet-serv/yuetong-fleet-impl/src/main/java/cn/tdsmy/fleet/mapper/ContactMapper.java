package cn.tdsmy.fleet.mapper;

import cn.tdsmy.fleet.beans.Contact;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ContactMapper {
    void insertContact(@Param("truckId") int truckId, @Param("driverId") int driverId);

    void deleteContact(@Param("contactId") int contactId);

    List<Contact> selectContact(@Param("contactId") int contactId);
}
