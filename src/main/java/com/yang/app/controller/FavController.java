package com.yang.app.controller;

import com.yang.app.service.FavService;
import com.yang.app.vo.FavVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@Controller
@RequestMapping("/fav")
public class FavController {

    @Autowired
    private FavService favService;

    // 관심 게시글 출력
    @RequestMapping("/list")
    public String getBoardList(
            HttpServletRequest request,
            @RequestParam(value = "page", defaultValue = "0") final int page,
            @RequestParam(value = "size", defaultValue = "9") final int size,
            Model model) {
        final String mid = (String) request.getSession().getAttribute("mid");
        model.addAttribute("totalCount", favService.getTotalCount(mid));
        model.addAttribute("list", favService.getPageList(mid, page, size));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        return "myconcern";
    }

    // 관심 게시글 추가
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insertFav(FavVO fVO, HttpServletResponse response) throws IOException {
        System.out.println("insertFav 도착");
        PrintWriter out = response.getWriter();
        System.out.println(fVO);
        System.out.println(fVO.getMid());
        System.out.println(fVO.getBnum());
        if (favService.getFav(fVO) == null) {
            System.out.println("insertFav 안에 insertFav 직전");
            if (favService.insertFav(fVO)) {
                System.out.println("관심글 등록 성공");
                out.print("success");
            } else {
                System.out.println("관심글 등록 실패");
                out.print("fail");
            }
        } else {
            System.out.println("관심글 등록 취소");
            System.out.println(fVO);
            favService.deleteFav(fVO);
            out.print("cancel");
        }
    }

    // 관심 게시글 판별
    @ResponseBody
    @RequestMapping(value = "/isFav", method = RequestMethod.GET)
    public String isFav(@RequestParam("mid") final String mid, @RequestParam("bnum") final int bnum) {
        System.out.println("isFav 입장");
        FavVO fVO = new FavVO();
        fVO.setMid(mid);
        fVO.setBnum(bnum);
        System.out.println("isFav fDAO.isFav 수행 직전");
        return Boolean.toString(favService.isFav(fVO));
    }
}
