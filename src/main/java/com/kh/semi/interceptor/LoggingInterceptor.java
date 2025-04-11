package com.kh.semi.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Slf4j
@Component
public class LoggingInterceptor implements HandlerInterceptor {

    // 요청이 컨트롤러에 전달되기 전에 실행
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        // 요청 시작 시간 기록 (소요 시간 측정을 위해)
        request.setAttribute("startTime", System.currentTimeMillis());

        log.info("[Request] Method: [{}], URL: [{}], IP: [{}], User-Agent: [{}]",
                request.getMethod(),
                request.getRequestURI(),
                request.getRemoteAddr(),
                request.getHeader("User-Agent"));

        return true;  // 요청을 계속 진행
    }

    // 요청이 완료된 후 실행 (예외 발생 여부와 관계없이 실행)
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        // 요청 완료 후 소요 시간 계산
        long startTime = (Long) request.getAttribute("startTime");
        long duration = System.currentTimeMillis() - startTime;

        log.info("[Response] Status: [{}], Duration: [{}] ms",
                response.getStatus(), duration);

        // 예외가 발생한 경우 예외 정보도 로깅
        if (ex != null) {
            log.error("[Error] Exception occurred: ", ex);
        }
    }
}
