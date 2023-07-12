package cn.tdsmy.core.constant;

/**
 * 缓存常量信息
 */
public class CacheConstants {
    /**
     * 权限缓存有效期，默认300（秒）
     */
    public final static long PERMISSION_EXPIRATION = 300;

    /**
     * 验证码 redis key
     */
    public static final String CAPTCHA_CODE_KEY = "captcha_codes:";

    /**
     * 验证码有效期（分钟）
     */
    public static final long CAPTCHA_EXPIRATION = 2;
}

