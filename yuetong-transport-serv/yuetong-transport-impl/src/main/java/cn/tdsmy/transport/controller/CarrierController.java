package cn.tdsmy.transport.controller;

import cn.tdsmy.core.constant.CarrierStatus;
import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.transport.beans.Carrier;
import cn.tdsmy.transport.beans.vo.CarrierVO;
import cn.tdsmy.transport.service.CarrierService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Slf4j
@RestController
@RequestMapping("/transport/carrier")
public class CarrierController {

    @Autowired
    private CarrierService carrierService;


    @PostMapping
    @Log(title = "录入承运单", businessType = BusinessType.INSERT)
    public AjaxResult newCarrier(@RequestBody CarrierVO carrierVO, @RequestHeader("account") String account) {
        Carrier carrier = Carrier.getCarrier(carrierVO);
        // 初始化完成情况
        carrier.setFinishedState(CarrierStatus.INIT.ordinal());
        // 计算总金额
        double totalCost = carrier.getInsuranceCost() + carrier.getTransportCost() + carrier.getOtherCost();
        carrier.setTotalCost(totalCost);

        // 承运业务员
        carrier.setAccount(account);
        // 配置录入时间
        Date now = new Date();
        carrier.setCheckInTime(now);
        carrier.setAlterTime(now);

        carrierService.newCarrier(carrier);
        return AjaxResult.success("录入成功");
    }

    @GetMapping
    @Log(title = "查询本人提交的承运单（运输中）", businessType = BusinessType.SELECT)
    public AjaxResult searchCarriers(@RequestHeader("account") String account, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<Carrier> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            carrierService.getCarriers(account);
        });
        return AjaxResult.success(pageInfo);
    }

    @PutMapping
    @Log(title = "标记承运单为已完成", businessType = BusinessType.UPDATE)
    public AjaxResult updateCarriers(@RequestParam("carrierId") int carrierId) {
        carrierService.updateCarrier(carrierId, new Date(), CarrierStatus.COMPLETED.ordinal());
        return AjaxResult.success("承运单标记为已完成");
    }


}
