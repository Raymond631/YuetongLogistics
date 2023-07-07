package cn.tdsmy.auth;

import cn.dev33.satoken.reactor.filter.SaReactorFilter;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * [Sa-Token 权限认证] 配置类
 */
@Slf4j
@Configuration
public class SaTokenConfigure {
    // 注册 Sa-Token全局过滤器
    @Bean
    public SaReactorFilter getSaReactorFilter() {
        return new SaReactorFilter()
                // 拦截地址
                .addInclude("/**")    /* 拦截全部path */
                // 开放地址
                .addExclude("/favicon.ico")
                // 鉴权方法：每次访问进入
                .setAuth(obj -> {
                    log.error("开始鉴权");
                    // 登录校验 -- 拦截所有路由，并排除/user/doLogin 用于开放登录
                    SaRouter.match("/**", "/auth/login", r -> StpUtil.checkLogin());

                    // 权限认证 -- 不同模块, 校验不同权限
                    SaRouter.match("/fleet/**", r -> StpUtil.checkPermission("fleet"));
                    SaRouter.match("/system/**", "/system/user/password", r -> StpUtil.checkPermission("system"));
                    SaRouter.match("/transport/carrier/**", r -> StpUtil.checkPermission("carrier"));
                    SaRouter.match("/transport/capacity/**", r -> StpUtil.checkPermission("capacity"));
                    SaRouter.match("/transport/scheduling/**", r -> StpUtil.checkPermission("scheduling"));
                    SaRouter.match("/transport/cost/**", r -> StpUtil.checkPermission("cost"));
                    SaRouter.match("/transport/capacity/carrier/**", r -> StpUtil.checkPermission("cost"));

                    // 更多匹配 ...  */
                })
                // 异常处理方法：每次setAuth函数出现异常时进入
                .setError(e -> {
                    return SaResult.error(e.getMessage());
                })
                ;
    }
}

