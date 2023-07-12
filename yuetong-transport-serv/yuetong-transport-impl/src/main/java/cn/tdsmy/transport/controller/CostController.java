package cn.tdsmy.transport.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.transport.beans.Cost;
import cn.tdsmy.transport.beans.vo.CostQueryVO;
import cn.tdsmy.transport.beans.vo.CostVO;
import cn.tdsmy.transport.service.CostService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/transport/cost")
public class CostController {
    @Autowired
    private CostService costService;

    @GetMapping("/getCarriers")
    @Log(title = "查询承运单（已完成）", businessType = BusinessType.SELECT)
    public AjaxResult getCarriers(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<CostQueryVO> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            costService.getCarriers();
        });
        return AjaxResult.success(pageInfo);
    }

    /**
     * 录入成本
     * 标记承运单为“成本已录入”
     */
    @PutMapping
    @Log(title = "录入成本", businessType = BusinessType.UPDATE)
    public AjaxResult addCost(@RequestBody Cost cost) {
        costService.addCost(cost);
        return AjaxResult.success("录入成功");
    }

    @GetMapping
    @Log(title = "运输成本报表", businessType = BusinessType.SELECT)
    public AjaxResult getCost(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<CostVO> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            costService.getCost();
        });
        return AjaxResult.success(pageInfo);
    }
}
