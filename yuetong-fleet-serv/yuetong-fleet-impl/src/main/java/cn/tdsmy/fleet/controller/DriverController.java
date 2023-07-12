package cn.tdsmy.fleet.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.core.utils.excel.ExcelUtil;
import cn.tdsmy.fleet.beans.Driver;
import cn.tdsmy.fleet.service.DriverService;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/fleet/driver")
public class DriverController {
    @Autowired
    private DriverService driverService;

    @PostMapping("/importDriver")
    @Log(title = "批量导入司机", businessType = BusinessType.IMPORT)
    public AjaxResult importDriver(@RequestParam("file") MultipartFile file) throws Exception {
        ExcelUtil<Driver> util = new ExcelUtil<>(Driver.class);
        List<Driver> driverList = util.importExcel(file.getInputStream());
        String message = driverService.importUser(driverList);
        return AjaxResult.success(message);
    }

    @DeleteMapping
    @Log(title = "删除司机", businessType = BusinessType.DELETE)
    public AjaxResult deleteDriver(@RequestParam("driverId") int driverId) {
        driverService.deleteDriver(driverId);
        return AjaxResult.success("删除成功");
    }

    @GetMapping
    @Log(title = "查询司机列表", businessType = BusinessType.SELECT)
    public AjaxResult getDriverList(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<Driver> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            driverService.getDriverList();
        });
        return AjaxResult.success(pageInfo);
    }
}
