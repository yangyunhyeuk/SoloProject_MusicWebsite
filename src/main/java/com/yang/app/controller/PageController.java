package com.yang.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {

    // 메인 페이지 이동
    @RequestMapping("/")
    public String indexRedirect() {
        return "redirect:/main";
    }

    // 메인 페이지 이동
    @RequestMapping("/main")
    public String index() {
        return "main";
    }

    // 로그인 페이지 이동
    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String loginPrint() {
        return "signin";
    }


    // 회원가입 페이지 이동
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup() {
        return "signup";
    }

    // 게시글 작성 페이지 이동
    @RequestMapping("/writepost")
    public String writepost() {
        return "writepost";
    }

    // contact 페이지 이동
    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }

    // 마이페이지 이동, 관심글 목록
    @RequestMapping(value = "/myconcern", method = RequestMethod.GET)
    public String myconcern() {
        return "redirect:/fav/list";
    }

    // 마이페이지 이동, 내정보 수정
    @RequestMapping(value = "/myinfo", method = RequestMethod.GET)
    public String myinfo() {
        return "myinfo";
    }

    // 임시 비밀번호 설정
    @RequestMapping(value = "/sendPW", method = RequestMethod.GET)
    public String sendPW() {
        return "sendPW";
    }

    // 아티스트 top 100
    @RequestMapping(value = "/lastfm", method = RequestMethod.GET)
    public String lastfm() {
        return "lastfm";
    }

    // 아티스트 top 20
    @RequestMapping(value = "/napster", method = RequestMethod.GET)
    public String napster() {
        return "napster";
    }

    // audius trending 100 track
    @RequestMapping(value = "/audius", method = RequestMethod.GET)
    public String audius() {
        return "audius";
    }


}