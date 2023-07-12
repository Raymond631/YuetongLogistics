package cn.tdsmy.transport.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.transport.beans.Carrier;
import cn.tdsmy.transport.beans.Scheduling;
import cn.tdsmy.transport.beans.vo.TruckAndDriver;
import cn.tdsmy.transport.service.ScheduleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/transport/scheduling")
public class ScheduleController {
    @Autowired
    private ScheduleService scheduleService;

    @GetMapping("/getCarriers")
    @Log(title = "查询承运单（待调度）", businessType = BusinessType.SELECT)
    public AjaxResult getCarriers(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<Carrier> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            scheduleService.getCarriers();
        });
        return AjaxResult.success(pageInfo);
    }

    @GetMapping("/freeTruck")
    @Log(title = "查询空闲车辆", businessType = BusinessType.SELECT)
    public AjaxResult getFreeTruck(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<TruckAndDriver> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            scheduleService.getFreeTruck();
        });
        return AjaxResult.success(pageInfo);
    }

    /**
     * 添加调度表，将承运单分给空闲的车辆
     * 修改承运单状态
     * 修改车辆状态
     * 修改车辆绑定的司机的状态
     */
    @PostMapping
    @Log(title = "调度承运任务", businessType = BusinessType.INSERT)
    public AjaxResult schedule(@RequestHeader("account") String account, @RequestParam("carrierId") int carrierId, @RequestParam("truckId") int truckId) {
        Scheduling scheduling = new Scheduling(carrierId, truckId, account);
        scheduleService.insertSchedule(scheduling);
        return AjaxResult.success("调度成功");
    }
}
