package cn.tdsmy.auth;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.reactor.filter.SaReactorFilter;
import cn.dev33.satoken.router.SaHttpMethod;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * [Sa-Token 权限认证] 配置类（包含跨域处理）
 */
@Slf4j
@Configuration
public class SaTokenConfigure {
    /**
     * 注册 Sa-Token全局过滤器
     */
    @Bean
    public SaReactorFilter getSaReactorFilter() {
        return new SaReactorFilter()
                // 拦截地址
                .addInclude("/**")    /* 拦截全部path */
                // 开放地址
                .addExclude("/favicon.ico")
                // 鉴权方法：每次访问进入
                .setAuth(obj -> {
                    log.error("SaToken过滤器");
                    // 登录校验 -- 拦截所有路由，并排除/user/doLogin 用于开放登录
                    SaRouter.match("/**", "/auth/**", r -> StpUtil.checkLogin());

                    // 权限认证 -- 不同模块, 校验不同权限
                    SaRouter.match("/fleet/**", r -> StpUtil.checkPermission("fleet"));
                    SaRouter.match("/system/**", "/system/user/password", r -> StpUtil.checkPermission("system"));
                    SaRouter.match("/transport/carrier/**", r -> StpUtil.checkPermission("carrier"));
                    SaRouter.match("/transport/capacity/**", r -> StpUtil.checkPermission("capacity"));
                    SaRouter.match("/transport/scheduling/**", r -> StpUtil.checkPermission("scheduling"));
                    SaRouter.match("/transport/cost/**", r -> StpUtil.checkPermission("cost"));
                    SaRouter.match("/transport/capacity/carrier/**", r -> StpUtil.checkPermission("cost"));
                })
                // 异常处理方法：每次setAuth函数出现异常时进入
                .setError(e -> {
                    return SaResult.error(e.getMessage());
                })
                // 前置函数：在每次认证函数之前执行
                .setBeforeAuth(obj -> {
                    SaHolder.getResponse()
                            // ---------- 设置跨域响应头 ----------
                            // 允许指定域访问跨域资源
                            .setHeader("Access-Control-Allow-Origin", "*")
                            // 允许所有请求方式
                            .setHeader("Access-Control-Allow-Methods", "*")
                            // 允许的header参数
                            .setHeader("Access-Control-Allow-Headers", "*")
                            // 有效时间
                            .setHeader("Access-Control-Max-Age", "3600")
                            // TODO 允许跨域cookie,可行性待验证
                            .setHeader("Access-Control-Allow-Credentials", "true")
                    ;
                    // 如果是预检请求，则立即返回到前端
                    SaRouter.match(SaHttpMethod.OPTIONS)
                            .free(r -> System.out.println("--------OPTIONS预检请求，不做处理"))
                            .back();
                })
                ;
    }
}

