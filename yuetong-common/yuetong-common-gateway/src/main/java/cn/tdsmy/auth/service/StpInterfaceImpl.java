package cn.tdsmy.auth.service;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.session.SaSessionCustomUtil;
import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import cn.tdsmy.core.constant.CacheConstants;
import cn.tdsmy.system.feign.ISystemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * 自定义权限验证接口扩展
 */
@Slf4j
@Component
public class StpInterfaceImpl implements StpInterface {
    @Autowired
    private ISystemService iSystemService;

    /**
     * 返回此 loginId 拥有的权限列表
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        List<String> permissionList = new ArrayList<>();
        for (String roleId : getRoleList(loginId, loginType)) {
            SaSession roleSession = SaSessionCustomUtil.getSessionById("role-" + roleId);
            List<String> list = roleSession.get("Permission_List", () -> {
                // WebFlux异步调用，同步会报错
                CompletableFuture<List<String>> completableFuture = CompletableFuture.supplyAsync(() -> this.iSystemService.getPermission(Integer.parseInt(roleId)));
                // 获取异步调用的返回值
                List<String> pList = completableFuture.join();
                // 添加到缓存，以便下次使用
                roleSession.set("Permission_List", pList);
                // 设置过期时间，单位为“秒”
                roleSession.updateTimeout(CacheConstants.PERMISSION_EXPIRATION);
                return pList;
            });
            permissionList.addAll(list);
        }
        return permissionList;
    }

    /**
     * 返回此 loginId 拥有的角色列表
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        SaSession accountSession = StpUtil.getSessionByLoginId(loginId);
        return accountSession.get("Role_List", () -> {
            // WebFlux异步调用，同步会报错
            CompletableFuture<Integer> completableFuture = CompletableFuture.supplyAsync(() -> this.iSystemService.getRoleId((String) loginId));
            // 获取异步调用的返回值
            int roleId = completableFuture.join();
            // 构建list，适应框架interface
            List<String> roleList = new ArrayList<>();
            roleList.add(String.valueOf(roleId));
            // 添加到缓存，以便下次使用
            accountSession.set("Role_List", roleList);
            return roleList;
        });
    }

}

