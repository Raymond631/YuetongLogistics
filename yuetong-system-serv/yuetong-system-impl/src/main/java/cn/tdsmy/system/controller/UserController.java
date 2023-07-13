package cn.tdsmy.system.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.core.utils.excel.ExcelUtil;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.system.beans.User;
import cn.tdsmy.system.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/system/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/importUser")
    @Log(title = "批量导入用户", businessType = BusinessType.IMPORT)
    public AjaxResult importUser(MultipartFile file) throws Exception {
        ExcelUtil<User> util = new ExcelUtil<>(User.class);
        List<User> userList = util.importExcel(file.getInputStream());
        String message = userService.importUser(userList);
        return AjaxResult.success(message);
    }

    @DeleteMapping
    @Log(title = "删除用户信息", businessType = BusinessType.DELETE)
    public AjaxResult deleteUser(@RequestParam("userId") int userId) {
        userService.deleteUser(userId);
        return AjaxResult.success("删除成功");
    }

    @PutMapping
    @Log(title = "修改用户角色", businessType = BusinessType.UPDATE)
    public AjaxResult updateUser(@RequestParam("userId") int userId, @RequestParam("roleId") int roleId) {
        userService.updateUserRole(userId, roleId);
        return AjaxResult.success("修改成功");
    }

    @GetMapping
    @Log(title = "查询用户信息", businessType = BusinessType.SELECT)
    public AjaxResult getUserList(@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<User> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            userService.getUserList();
        });
        return AjaxResult.success(pageInfo);
    }
}
