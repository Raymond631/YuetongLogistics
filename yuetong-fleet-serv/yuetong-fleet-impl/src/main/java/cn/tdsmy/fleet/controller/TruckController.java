package cn.tdsmy.fleet.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.core.utils.excel.ExcelUtil;
import cn.tdsmy.fleet.beans.Truck;
import cn.tdsmy.fleet.service.TruckService;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/fleet/truck")
public class TruckController {
    @Autowired
    private TruckService truckService;

    @PostMapping("/importTruck")
    @Log(title = "批量导入车辆", businessType = BusinessType.IMPORT)
    public AjaxResult importTruck(MultipartFile file) throws Exception {
        ExcelUtil<Truck> util = new ExcelUtil<>(Truck.class);
        List<Truck> truckList = util.importExcel(file.getInputStream());
        String message = truckService.importTruck(truckList);
        return AjaxResult.success(message);
    }

    @DeleteMapping
    @Log(title = "删除车辆", businessType = BusinessType.DELETE)
    public AjaxResult deleteTruck(@RequestParam("truckId") int truckId) {
        truckService.deleteTruck(truckId);
        return AjaxResult.success("删除成功");
    }

    @GetMapping
    @Log(title = "查询车辆列表", businessType = BusinessType.SELECT)
    public AjaxResult getTruckList(@RequestParam("queryType") int queryType, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<Truck> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            truckService.getTruckList(queryType);
        });
        return AjaxResult.success(pageInfo);
    }
}
