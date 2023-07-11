package mapper;

import beans.Msg;
import beans.Truck;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Mapper
public interface TruckMapper {

    public int postTruck(Truck truck);

    public int deleteTruck(int truckID);

    public int putTruck(Truck truck);

    public ArrayList<Object> getTruck(String number);
}
