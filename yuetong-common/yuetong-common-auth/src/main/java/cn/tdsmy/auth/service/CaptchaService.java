package cn.tdsmy.auth.service;

import cn.tdsmy.core.constant.CacheConstants;
import cn.tdsmy.core.exception.ServiceException;
import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.core.utils.RedisUtils;
import cn.tdsmy.core.utils.StringUtils;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FastByteArrayOutputStream;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 验证码实现处理
 *
 * @author ruoyi
 */
@Service
public class CaptchaService {
    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private LoginLogService loginLogService;

    /**
     * 生成验证码
     */
    public Object createCaptcha() {
        Map<String, Object> response = new HashMap<>();
        response.put("code", 200);
        response.put("msg", "操作成功");

        // 保存验证码信息
        String uuid = UUID.randomUUID().toString();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        String capStr, code = null;
        BufferedImage image = null;

        // 数学计算验证码
        String capText = captchaProducerMath.createText();
        capStr = capText.substring(0, capText.lastIndexOf("@"));
        code = capText.substring(capText.lastIndexOf("@") + 1);
        image = captchaProducerMath.createImage(capStr);

        // 字符验证码
        // capStr = code = captchaProducer.createText();
        // image = captchaProducer.createImage(capStr);

        redisUtils.setCacheObject(verifyKey, code, CacheConstants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try {
            ImageIO.write(image, "jpg", os);
        } catch (IOException e) {
            return AjaxResult.error(e.getMessage());
        }

        response.put("uuid", uuid);
        response.put("img", Base64.getEncoder().encodeToString(os.toByteArray()));
        return response;
    }

    /**
     * 校验验证码
     */
    public void checkCaptcha(String code, String uuid, String account) {
        if (StringUtils.isEmpty(code)) {
            loginLogService.recordLoginLog(account, "failed", "验证码不能为空");
            throw new ServiceException("验证码不能为空");
        }
        if (StringUtils.isEmpty(uuid)) {
            loginLogService.recordLoginLog(account, "failed", "验证码已失效");
            throw new ServiceException("验证码已失效");
        }
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisUtils.getCacheObject(verifyKey);
        redisUtils.deleteObject(verifyKey);

        if (!code.equalsIgnoreCase(captcha)) {
            loginLogService.recordLoginLog(account, "failed", "验证码错误");
            throw new ServiceException("验证码错误");
        }
    }
}

