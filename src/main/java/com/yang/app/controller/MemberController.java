package com.yang.app.controller;

import com.yang.app.service.MemberService;
import com.yang.app.utils.mail.MailSend;
import com.yang.app.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 로그인
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void login(@RequestBody MemberVO mVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("LoginAction 입장");

        MemberVO data = memberService.getLoginMem(mVO);
        PrintWriter out = response.getWriter();

        if (data != null) {
            System.out.println("로그인 성공");
            HttpSession session = request.getSession();
            session.setAttribute("mid", data.getMid());
            out.print("success");
            //return "redirect:/main";
        } else {
            System.out.println("로그인 실패");
            out.print("fail");
            //return "redirect:signin";
        }
    }

    // @RequestBody : 클라이언트가 json으로 날렸을 때 받아주게 하기 위한 어노테이션
    // 회원가입
    @ResponseBody
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public void join(@RequestBody MemberVO mVO, HttpServletResponse response) throws IOException {
        // TODO Auto-generated method stub
        PrintWriter out = response.getWriter();

        System.out.println(mVO.getMaddress());
        System.out.println(mVO.getMaddressDetail());
        System.out.println(mVO);

        String demo = mVO.getMaddress() + " " + mVO.getMaddressDetail();
        mVO.setMaddress(demo);

        System.out.println(mVO);

        if (memberService.insertMember(mVO)) {
            System.out.println("회원가입 성공");
            out.print("success");
        } else {
            System.out.println("회원가입 실패");
            out.print("fail");
        }
    }

    // 아이디 중복 검사
    @RequestMapping(value = "/checkId", method = RequestMethod.GET)
    public void checkId(MemberVO mVO, HttpServletResponse response) throws IOException {
        MemberVO data = memberService.getMember(mVO);
        PrintWriter out = response.getWriter();
        if (data != null) {
            System.out.println("checkId if문 진입");
            out.print("fail");
        } else {
            System.out.println("checkId else문 진입");
            out.print("success");
        }
    }

    // 로그아웃
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main";
    }

    //회원정보 수정
    @ResponseBody
    @RequestMapping(value = "/editMyinfo", method = RequestMethod.POST)
    public void editMyinfo(@RequestBody MemberVO mVO, HttpServletResponse response) throws IOException {
        // TODO Auto-generated method stub
        PrintWriter out = response.getWriter();
        System.out.println("회원정보 수정 컨트롤러 도착");
        System.out.println(mVO);

        if (memberService.updateMember(mVO)) {
            System.out.println("회원정보 수정 성공");
            out.print("success");
        } else {
            System.out.println("회원정보 수정 실패");
            out.print("fail");
        }
    }

    //회원 탈퇴
    @RequestMapping(value = "/quit", method = RequestMethod.GET)
    public String quit(MemberVO vo, @RequestParam("mid") final String mid) {
        System.out.println("/quit 입장");
        vo.setMid(mid);
        memberService.deleteMember(vo);
        System.out.println("/quit 퇴장");
        return "redirect:/logout";
    }

    // 멤버 정보 가져오기
    @ResponseBody
    @RequestMapping(value = "/getMember", method = RequestMethod.GET)
    public MemberVO getMember(MemberVO mVO, HttpServletRequest request) {
        String mid = (String) request.getSession().getAttribute("mid");
        mVO.setMid(mid);
        MemberVO data = memberService.getMember(mVO);
        return data;
    }


    // 임시비밀번호 전송
    @ResponseBody
    @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    public void sendMail(@RequestBody MemberVO mVO, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        MemberVO data = memberService.getMember(mVO);
        MailSend sender = new MailSend();

        if (data != null) {
            System.out.println("존재하는 회원");
            // 메일 보내는 작업!
            String mcontent = sender.MailSend((String) mVO.getMemail());
            mVO.setMpw(mcontent);

            // 업데이트
            if (memberService.updateMpw(mVO)) {
                System.out.println(mcontent);
                out.print("success");
            }
        } else {
            System.out.println("존재하지 않는 회원");
            out.print("fail");
        }

    }
}
