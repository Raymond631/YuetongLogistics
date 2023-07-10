package mapper;

import beans.Driver;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface DriverMapper {

    public int postDriver(Driver driver);

    public int deleteDriver(int driverID);

    public int putDriver(Driver driver);

    public ArrayList<Object> getDriverByName(String name);

    public ArrayList<Object> getDriverById_card(String idCard);
}
