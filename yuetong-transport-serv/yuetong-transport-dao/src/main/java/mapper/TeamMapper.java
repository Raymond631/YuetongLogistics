package mapper;

import beans.Msg;
import beans.TruckTeam;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Mapper
public interface TeamMapper {

    public int postTeam(TruckTeam truckTeam);

    public int deleteTeam(int teamID);

    public int putTeam(TruckTeam truckTeam);

    public ArrayList<Object> getTeam(String teamName);
}
