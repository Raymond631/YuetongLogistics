package cn.tdsmy.log.annotation;

import cn.tdsmy.log.enums.BusinessType;

import java.lang.annotation.*;

/**
 * 自定义操作日志记录注解
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 模块
     */
    public String title() default "";

    /**
     * 业务类型（增删改查、其他）
     */
    public BusinessType businessType() default BusinessType.OTHER;
}

