package cn.tdsmy.fleet.service;

import cn.tdsmy.core.constant.DriveStatus;
import cn.tdsmy.core.exception.ServiceException;
import cn.tdsmy.core.utils.StringUtils;
import cn.tdsmy.fleet.beans.Truck;
import cn.tdsmy.fleet.mapper.TruckMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class TruckService {
    @Autowired
    private TruckMapper truckMapper;

    public String importTruck(List<Truck> truckList) {
        if (StringUtils.isNull(truckList) || truckList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();

        // 获取当前时间
        Date now = new Date();

        for (Truck truck : truckList) {
            truck.setState(DriveStatus.FREE);
            truck.setCheckInTime(now);
            truck.setAlterTime(now);
            if (truck.getRemark() == null) {
                truck.setRemark("无");
            }
            try {
                truckMapper.insertTruck(truck);
                successNum++;
                successMsg.append("<br/>" + successNum + "、司机 " + truck.getNumber() + " 导入成功");
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、司机 " + truck.getNumber() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }

        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    public void deleteTruck(int truckId) {
        truckMapper.deleteTruck(truckId);
    }

    public List<Truck> getTruckList() {
        return truckMapper.selectTruckList();
    }
}
