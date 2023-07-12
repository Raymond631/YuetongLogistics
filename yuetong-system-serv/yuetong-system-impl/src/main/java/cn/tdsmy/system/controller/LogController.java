package cn.tdsmy.system.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.core.utils.excel.ExcelUtil;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.beans.OperateLog;
import cn.tdsmy.system.service.LogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/system/log")
public class LogController {
    @Autowired
    private LogService logService;

    /**
     * 登录日志
     */
    @GetMapping("/loginLog")
    public AjaxResult getLoginLog(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<LoginLog> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            logService.getLoginLog();
        });
        return AjaxResult.success(pageInfo);
    }

    /**
     * 操作日志
     */
    @GetMapping("/operateLog")
    public AjaxResult getOperateLog(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<OperateLog> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            logService.getOperateLog();
        });
        return AjaxResult.success(pageInfo);
    }

    @GetMapping("/exportLoginLog")
    @Log(title = "导出登录日志", businessType = BusinessType.EXPORT)
    public void exportLoginLog(HttpServletResponse response) {
        List<LoginLog> list = logService.getLoginLog();
        ExcelUtil<LoginLog> util = new ExcelUtil<>(LoginLog.class);
        util.exportExcel(response, list, "登录日志");
    }

    @GetMapping("/exportOperateLog")
    @Log(title = "导出操作日志", businessType = BusinessType.EXPORT)
    public void exportOperateLog(HttpServletResponse response) {
        List<OperateLog> list = logService.getOperateLog();
        ExcelUtil<OperateLog> util = new ExcelUtil<>(OperateLog.class);
        util.exportExcel(response, list, "操作日志");
    }

}
