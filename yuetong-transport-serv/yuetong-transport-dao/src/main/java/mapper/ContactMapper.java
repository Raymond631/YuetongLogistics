package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
public interface ContactMapper {

    public int bind(int fkTruckID, int fkDriverID);
    public int findBind(int fkTruckID, int fkDriverID);
    public int unbind(int fkTruckID, int fkDriverID);
}
