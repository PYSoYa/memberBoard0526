package com.its.memberBoard.controller;

import com.its.memberBoard.dtos.BoardDTO;
import com.its.memberBoard.dtos.CommentDTO;
import com.its.memberBoard.dtos.PageDTO;
import com.its.memberBoard.service.BoardService;
import com.its.memberBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/saveFile")
    public String saveFileForm(){
        return  "/boardPages/save";
    }

    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.saveFile(boardDTO);
        return "redirect:/board/findAll";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<BoardDTO> boardDTO1 = boardService.findAll();
        model.addAttribute("boardList",boardDTO1);
        return "redirect:/board/paging";
    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "/boardPages/list";
    }

    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model){
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("boardList", searchList);
        return "/boardPages/list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id,@RequestParam("boardWriter") String boardWriter, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1")
                           int page,HttpSession session){
        String memberId = (String) session.getAttribute("loginMemberId");
        BoardDTO result = boardService.findById(id);
        PageDTO paging = boardService.paging(page);
        String boardWriter1 = boardWriter;
        model.addAttribute("board",result);
        model.addAttribute("paging",paging);
        model.addAttribute("boardWriter",boardWriter1);
        model.addAttribute("memberId",memberId);

        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "/boardPages/detail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, HttpSession session, Model model){
        BoardDTO result = boardService.findById(id);
        model.addAttribute("board",result);
        return "/boardPages/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO,
                         @RequestParam(value = "page", required = false, defaultValue = "1")
                         int page,Model model){
       boolean result =  boardService.update(boardDTO);
       if(result){
           model.addAttribute("paging",page);
           return "redirect:/board/detail?id="+boardDTO.getId()+"&boardWriter="+boardDTO.getBoardWriter();
       }else{
           return "redirect:/board/update";
       }
    }


    @GetMapping("/delete")
     public String delete(@RequestParam("id") Long id,
                          @RequestParam(value = "page", required = false,
                                  defaultValue = "1") int page,Model model){
       boolean result = boardService.delete(id);
       if(result){
           model.addAttribute("paging",page);
           return "redirect:/board/findAll";
       }else{
           return "index";
       }
    }



}
