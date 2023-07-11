package cn.tdsmy.fleet.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.fleet.service.ContactService;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/fleet/contact")
public class ContactController {
    @Autowired
    private ContactService contactService;

    @PostMapping
    @Log(title = "绑定司机和车辆", businessType = BusinessType.INSERT)
    public AjaxResult bind(@RequestParam("truckId") int truckId, @RequestParam("driverId") int driverId) {
        contactService.bind(truckId, driverId);
        return AjaxResult.success("绑定成功");
    }

    @PostMapping
    @Log(title = "解绑司机和车辆", businessType = BusinessType.DELETE)
    public AjaxResult unbind(@RequestParam("contactId") int contactId) {
        contactService.unbind(contactId);
        return AjaxResult.success("解绑成功");
    }

//    @GetMapping
//    @Log(title = "解绑司机和车辆", businessType = BusinessType.SELECT)
//    public AjaxResult getDriverList(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
//        PageInfo<Driver> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
//            driverService.getDriverList();
//        });
//        return AjaxResult.success(pageInfo);
//    }
}
