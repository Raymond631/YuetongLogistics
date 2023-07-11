package cn.tdsmy.system.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.core.utils.excel.ExcelUtil;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.system.beans.User;
import cn.tdsmy.system.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
    public AjaxResult importData(MultipartFile file) throws Exception {
        ExcelUtil<User> util = new ExcelUtil<>(User.class);
        List<User> userList = util.importExcel(file.getInputStream());
        String message = userService.importUser(userList);
        return AjaxResult.success(message);
    }
}
