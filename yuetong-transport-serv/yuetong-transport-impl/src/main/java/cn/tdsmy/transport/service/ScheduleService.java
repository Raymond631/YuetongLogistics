package cn.tdsmy.transport.service;

import cn.tdsmy.transport.beans.Carrier;
import cn.tdsmy.transport.beans.Scheduling;
import cn.tdsmy.transport.beans.vo.TruckAndDriver;
import cn.tdsmy.transport.mapper.ScheduleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;

    public List<Carrier> getCarriers() {
        return scheduleMapper.selectCarriers();
    }

    public List<TruckAndDriver> getFreeTruck() {
        return scheduleMapper.selectFreeTruck();
    }

    @Transactional
    public void insertSchedule(Scheduling scheduling) {
        // 添加调度表
        scheduleMapper.insertSchedule(scheduling);
        // 修改承运单状态
        scheduleMapper.updateCarrierStatus(scheduling.getFkCarriersId());
        // 修改车辆状态
        scheduleMapper.updateTruckStatus(scheduling.getFkTruckId());
        // 修改司机状态
        int driverId = scheduleMapper.getDriverId(scheduling.getFkTruckId());
        scheduleMapper.updateDriverStatus(driverId);
    }
}
