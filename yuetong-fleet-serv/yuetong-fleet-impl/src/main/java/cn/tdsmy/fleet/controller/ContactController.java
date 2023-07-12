package cn.tdsmy.fleet.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.fleet.beans.Contact;
import cn.tdsmy.fleet.service.ContactService;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @DeleteMapping
    @Log(title = "解绑司机和车辆", businessType = BusinessType.DELETE)
    public AjaxResult unbind(@RequestParam("contactId") int contactId) {
        contactService.unbind(contactId);
        return AjaxResult.success("解绑成功");
    }

    @GetMapping
    @Log(title = "查询绑定信息", businessType = BusinessType.SELECT)
    public AjaxResult getBindInfo(@RequestParam("contactId") int contactId, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<Contact> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            contactService.getContactList(contactId);
        });
        return AjaxResult.success(pageInfo);
    }
}
