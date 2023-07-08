package cn.tdsmy.auth;

import cn.dev33.satoken.stp.StpUtil;
import cn.tdsmy.core.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.annotation.Order;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * SaToken的优先值为-100，本类需要在SaToken之后执行，所以优先值设为0
 */
@Slf4j
@Order(0)
@Component
public class RewriteHeaderFilter implements GlobalFilter {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.error("重写请求头过滤器");
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpRequest.Builder mutate = request.mutate();
        // 获取请求url
        String url = request.getURI().getPath();

        // 跳过不需要过滤的路径(白名单)
        List<String> whites = new ArrayList<>(Collections.singletonList("/auth/**"));
        if (StringUtils.matches(url, whites)) {
            log.error("不需要重写");
            return chain.filter(exchange);
        }

        // 获取用户信息，重写请求头
        String account = StpUtil.getLoginIdAsString();
        log.error("重写请求头account为：" + account);
        try {
            addHeader(mutate, "account", account);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return chain.filter(exchange.mutate().request(mutate.build()).build());
    }

    private void addHeader(ServerHttpRequest.Builder mutate, String name, Object value) throws UnsupportedEncodingException {
        if (value == null) {
            return;
        }
        String valueStr = value.toString();
        String valueEncode = URLEncoder.encode(valueStr, "UTF-8");
        mutate.header(name, valueEncode);
    }
}
