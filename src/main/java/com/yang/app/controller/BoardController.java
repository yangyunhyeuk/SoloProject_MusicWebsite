package com.yang.app.controller;

import com.yang.app.service.BoardService;
import com.yang.app.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.List;


@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 게시물 전체 출력
    @RequestMapping("/list")
    public String getBoardList(
            @RequestParam(value = "page", defaultValue = "0") final int page,
            @RequestParam(value = "size", defaultValue = "9") final int size,
            Model model) {
        model.addAttribute("totalCount", boardService.getTotalCount());
        model.addAttribute("list", boardService.getPageList(page, size));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        return "board";
    }


    // 게시물 작성
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    public String writeBoard(MultipartFile filename, @RequestParam("btitle") final String btitle,
                             @RequestParam("bwriter") final String bwriter, @RequestParam("bcontent") final String bcontent) {
        System.out.println("WriteAction 입장");
        System.out.println(Charset.defaultCharset().displayName());

        //System.out.println(bVO);
        System.out.println(filename);
        BoardVO bVO = new BoardVO();
        bVO.setBtitle(btitle);
        bVO.setBwriter(bwriter);
        bVO.setBcontent(bcontent);
        bVO.setFilename(filename.getOriginalFilename());

        System.out.println(bVO);

        String saveDir = "C:/tempImage"; // 서버 이미지 경로

        if (!new File(saveDir).exists()) {
            new File(saveDir).mkdirs();
        }
        System.out.println("bVO  :" + bVO);
        System.out.println("절대경로  :" + saveDir);

        boardService.insertBoard(bVO);

        if (filename != null && filename.getOriginalFilename() != null && !filename.getOriginalFilename().equals("")) {
            File target = new File(saveDir, filename.getOriginalFilename());
            // 전송한 파일 생성

            try {
                FileCopyUtils.copy(filename.getBytes(), target);
                // FileCopyUtils.copy(바이트 배열, 저장 경로);
                // 메모리 상에 존재하는 파일을 복사하여 저장하는 개념이다.
                // 해당 바이트 배열(바이너리 코드)를 저장 경로에 복사하여 저장
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/board/list";
    }

    // /board/post?bnum=${vo.bnum}
    // board 내 post 게시글 이동
    @RequestMapping("/post")
    public String post(BoardVO bVO, Model model, @RequestParam("size") final int size, @RequestParam("page") final int page) {
        // bVO.setBnum(bnum);
        BoardVO data = boardService.getBoard(bVO);
        model.addAttribute("page", page);
        model.addAttribute("size", size);

        model.addAttribute("bnum", data.getBnum());
        model.addAttribute("btitle", data.getBtitle());
        model.addAttribute("filename", data.getFilename());
        model.addAttribute("bcontent", data.getBcontent());
        return "post";
    }

    // postedit 이동
    @RequestMapping("/postedit")
    public String postedit(Model model, @RequestParam("bnum") final int bnum, @RequestParam("size") final int size, @RequestParam("page") final int page) {
        BoardVO bVO = new BoardVO();
        bVO.setBnum(bnum);
        BoardVO data = boardService.getBoard(bVO);

        model.addAttribute("page", page);
        model.addAttribute("size", size);

        model.addAttribute("bnum", data.getBnum());
        model.addAttribute("btitle", data.getBtitle());
        model.addAttribute("filename", data.getFilename());
        model.addAttribute("bcontent", data.getBcontent());
        return "postedit";
    }

    // 게시물 삭제
    @RequestMapping("/postdelete")
    public String postdelete(BoardVO bVO, @RequestParam("size") final int size, @RequestParam("page") int page) {
        boardService.deleteBoard(bVO);

        List<BoardVO> datas = boardService.getPageList(page, size);

        if (datas == null || datas.size() == 0) {
            --page;
        }
        return String.format("redirect:/board/list?page=%s&size=%s", page, size);


//        return "redirect:/board/list?page=" + page + "&size=" + size;
        //http://localhost:8080/board/list?page=2&size=9


    }

    // 게시물 수정
    @RequestMapping(value = "/postupdate", method = RequestMethod.POST)
    public void postupdate(BoardVO bVO, HttpServletResponse response) throws IOException {
        System.out.println("postupdate 진입");
        PrintWriter out = response.getWriter();
        if (boardService.updateBoard(bVO)) {
            System.out.println("postupdate 진입후 if 입장");
            out.print("success");
        } else {
            System.out.println("postupdate 진입후 else 입장");
            out.print("fail");
        }
    }
}
