package cn.tdsmy.system.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.system.beans.OperateLog;
import cn.tdsmy.system.beans.Role;
import cn.tdsmy.system.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * TODO 暂时不用
 */
@RestController
@RequestMapping("/system/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @PostMapping
    @Log(title = "添加角色", businessType = BusinessType.INSERT)
    public AjaxResult insertRole(@RequestBody Role role) {
        roleService.insertRole(role);
        return AjaxResult.success("添加成功");
    }

    @DeleteMapping
    @Log(title = "删除角色", businessType = BusinessType.DELETE)
    public AjaxResult deleteRole(@RequestParam("roleId") int roleId) {
        roleService.deleteRole(roleId);
        return AjaxResult.success("删除成功");
    }

    @PutMapping
    @Log(title = "修改角色权限字符串", businessType = BusinessType.UPDATE)
    public AjaxResult updateRole(@RequestBody Role role) {
        roleService.updateRole(role);
        return AjaxResult.success("修改成功");
    }

    @GetMapping
    @Log(title = "查询角色列表", businessType = BusinessType.SELECT)
    public AjaxResult getRoleList(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<OperateLog> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            roleService.getRoleList();
        });
        return AjaxResult.success(pageInfo);
    }
}
