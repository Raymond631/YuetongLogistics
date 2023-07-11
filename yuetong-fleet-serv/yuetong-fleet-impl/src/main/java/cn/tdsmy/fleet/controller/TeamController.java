package cn.tdsmy.fleet.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.core.utils.excel.ExcelUtil;
import cn.tdsmy.fleet.beans.TruckTeam;
import cn.tdsmy.fleet.service.TeamService;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/fleet/team")
public class TeamController {
    @Autowired
    private TeamService teamService;

    @PostMapping("/importTeam")
    @Log(title = "批量导入车队", businessType = BusinessType.IMPORT)
    public AjaxResult importTeam(MultipartFile file) throws Exception {
        ExcelUtil<TruckTeam> util = new ExcelUtil<>(TruckTeam.class);
        List<TruckTeam> teamList = util.importExcel(file.getInputStream());
        String message = teamService.importTeam(teamList);
        return AjaxResult.success(message);
    }

    @DeleteMapping
    @Log(title = "删除车队", businessType = BusinessType.DELETE)
    public AjaxResult deleteTeam(@RequestParam("teamId") int teamId) {
        teamService.deleteTeam(teamId);
        return AjaxResult.success("删除成功");
    }

    @GetMapping
    @Log(title = "查询车队列表", businessType = BusinessType.SELECT)
    public AjaxResult getTeamList(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<TruckTeam> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            teamService.getTeamList();
        });
        return AjaxResult.success(pageInfo);
    }
}
