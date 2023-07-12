package cn.tdsmy.fleet.mapper;

import cn.tdsmy.fleet.beans.TruckTeam;
import cn.tdsmy.fleet.beans.vo.TruckTeamVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TeamMapper {
    void insertDriver(TruckTeam team);

    void deleteTeam(@Param("teamId") int teamId);

    List<TruckTeamVO> selectTeamList();
}
