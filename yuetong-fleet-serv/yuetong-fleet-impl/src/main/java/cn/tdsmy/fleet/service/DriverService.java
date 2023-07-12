package cn.tdsmy.fleet.service;

import cn.tdsmy.core.constant.DriveStatus;
import cn.tdsmy.core.constant.QueryType;
import cn.tdsmy.core.exception.ServiceException;
import cn.tdsmy.core.utils.StringUtils;
import cn.tdsmy.fleet.beans.Driver;
import cn.tdsmy.fleet.mapper.DriverMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class DriverService {
    @Autowired
    private DriverMapper driverMapper;

    public String importUser(List<Driver> driverList) {
        if (StringUtils.isNull(driverList) || driverList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();

        // 获取当前时间
        Date now = new Date();

        for (Driver driver : driverList) {
            driver.setState(DriveStatus.FREE);
            driver.setCheckInTime(now);
            driver.setAlterTime(now);
            if (driver.getRemark() == null) {
                driver.setRemark("无");
            }
            try {
                driverMapper.insertDriver(driver);
                successNum++;
                successMsg.append("<br/>" + successNum + "、司机 " + driver.getName() + " 导入成功");
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、司机 " + driver.getName() + " 导入失败：";
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

    public void deleteDriver(int driverId) {
        driverMapper.deleteDriver(driverId);
    }

    public List<Driver> getDriverList(int queryType) {
        switch (queryType) {
            case QueryType.ALL: {
                return driverMapper.selectDriverList();
            }
            case QueryType.BIND: {
                return driverMapper.selectBindDriverList();
            }
            case QueryType.UNBIND: {
                return driverMapper.selectUnbindDriverList();
            }
            default: {
                throw new ServiceException("查询类型参数错误");
            }
        }
    }
}
