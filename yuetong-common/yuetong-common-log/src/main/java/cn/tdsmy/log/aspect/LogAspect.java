package cn.tdsmy.log.aspect;

import cn.tdsmy.core.utils.IpUtils;
import cn.tdsmy.core.utils.StringUtils;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.system.beans.OperateLog;
import cn.tdsmy.system.feign.ISystemService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.NamedThreadLocal;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Objects;

@Slf4j
@Aspect
@Component
public class LogAspect {
    /**
     * 计算操作消耗时间
     */
    private static final ThreadLocal<Long> TIME_THREADLOCAL = new NamedThreadLocal<>("Cost Time");
    @Autowired
    private ISystemService iSystemService;

    /**
     * 处理请求前执行
     */
    @Before(value = "@annotation(controllerLog)")
    public void boBefore(JoinPoint joinPoint, Log controllerLog) {
        TIME_THREADLOCAL.set(System.currentTimeMillis());
    }

    /**
     * 处理完请求后执行(异步)
     */
    @AfterReturning(pointcut = "@annotation(controllerLog)", returning = "jsonResult")
    public void doAfterReturning(JoinPoint joinPoint, Log controllerLog, Object jsonResult) {
        handleLog(joinPoint, controllerLog, null, jsonResult);
    }

    /**
     * 拦截异常操作(异步)
     */
    @AfterThrowing(value = "@annotation(controllerLog)", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Log controllerLog, Exception e) {
        handleLog(joinPoint, controllerLog, e, null);
    }

    protected void handleLog(final JoinPoint joinPoint, Log controllerLog, final Exception e, Object jsonResult) {
        try {
            OperateLog operateLog = new OperateLog();
            // 1.请求时间
            operateLog.setOperTime(new Date());
            // 2.操作人员
            operateLog.setOperName(Objects.requireNonNull(IpUtils.getRequest()).getHeader("account"));
            // 3.请求源ip
            operateLog.setOperIp(IpUtils.getIpAddr());
            // 4.请求模块（注解标志）
            operateLog.setTitle(controllerLog.title());
            // 5.业务类型（注解标志）
            operateLog.setBusinessType(controllerLog.businessType().toString());
            // 6.请求方法
            operateLog.setRequestMethod(IpUtils.getRequest().getMethod());
            // 7.请求URL
            operateLog.setOperUrl(StringUtils.substring(IpUtils.getRequest().getRequestURI(), 0, 255));
            // 8.请求是否成功
            operateLog.setStatus("success");
            // 9.请求消时
            operateLog.setCostTime(System.currentTimeMillis() - TIME_THREADLOCAL.get());
            // 10.异常信息
            if (e != null) {
                operateLog.setStatus("failed");
                operateLog.setErrorMsg(StringUtils.substring(e.getMessage(), 0, 100));
            }

            log.info(operateLog.toString());
            // 保存数据库
            Runnable task = () -> iSystemService.saveOperateLog(operateLog);
            Thread thread = new Thread(task);
            thread.start();
        } catch (Exception exp) {
            // 记录本地异常日志
            log.error("异常信息:{}", exp.getMessage());
            exp.printStackTrace();
        } finally {
            TIME_THREADLOCAL.remove();
        }
    }
}
