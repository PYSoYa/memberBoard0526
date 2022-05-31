package com.its.memberBoard.controller;

import com.its.memberBoard.dtos.BoardDTO;
import com.its.memberBoard.dtos.MemberDTO;
import com.its.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "/memberPages/save";
    }

    @PostMapping("/save")
    public String saveFile(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.saveFile(memberDTO);
        return "/memberPages/login";
    }

    @PostMapping("/duplicateCheck")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
       String result= memberService.duplicateCheck(memberId);
        return result;
    }

    @GetMapping("/login")
    public String loginForm(){
        return "/memberPages/login";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        memberDTO = memberService.login(memberDTO);

        if(memberDTO != null){
            model.addAttribute("login",memberDTO);
            session.setAttribute("loginMemberId",memberDTO.getMemberId());
            session.setAttribute("loginPassword",memberDTO.getMemberPassword());
            session.setAttribute("loginId",memberDTO.getId());
            return "redirect:/board/findAll";
        }else{
            return "index";
        }

    }
    @GetMapping("/admin")
    public String admin(){
        return "/memberPages/admin";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return  "index";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
       List<MemberDTO> memberDTO = memberService.findAll();
       model.addAttribute("memberList",memberDTO);
       return "/memberPages/list";
    }
    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model){
       MemberDTO memberDTO = memberService.detail(id);
       if(memberDTO != null){
           model.addAttribute("member",memberDTO);
           return "/memberPages/detail";
       }else{
           return "/memberPages/list";
       }
    }
    @GetMapping("/passCheck")
    public String passCheck(HttpSession session, Model model){
        Long passCheck = (Long) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.detail(passCheck);
        model.addAttribute("member", memberDTO);
        return "/memberPages/passCheck";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
       boolean result = memberService.delete(id);
       if(result){
           return "redirect:/board/findAll";
       }else{
            return "index";
       }
    }
    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model){
        Long updateId = (Long) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.detail(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "/memberPages/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.update(memberDTO);
        return "redirect:/member/detail?id=" + memberDTO.getId();


    }
}
