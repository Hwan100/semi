package com.kh.semi.config;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Setting;
import com.kh.semi.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalModelAttributeConfig {

    @Autowired
    private BoardService boardService;

    @ModelAttribute("siteSetting")
    public Setting siteSetting() {
        return boardService.selectSiteSetting();
    }
}