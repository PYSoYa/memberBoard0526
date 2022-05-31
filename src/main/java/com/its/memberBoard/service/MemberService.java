package com.its.memberBoard.service;

import com.its.memberBoard.dtos.BoardDTO;
import com.its.memberBoard.dtos.MemberDTO;
import com.its.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Repository
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void saveFile(MemberDTO memberDTO) throws IOException {

        MultipartFile memberPhoto = memberDTO.getMemberPhoto(); // 1.
        String memberProfile = memberPhoto.getOriginalFilename(); // 2.
        memberProfile = System.currentTimeMillis() + "-" + memberProfile; // 2.1.
        // 3.
        String savePath = "D:\\spring_img\\" + memberProfile; // 4.

        if (!memberPhoto.isEmpty()) {
            memberDTO.setMemberProfile(memberProfile);
            memberPhoto.transferTo(new File(savePath));
        }
        memberRepository.saveFile(memberDTO); // 6.
    }
    public MemberDTO login(MemberDTO memberDTO) {
       return memberRepository.login(memberDTO);
    }

    public String duplicateCheck(String memberId) {
       String result = memberRepository.duplicateCheck(memberId);
        if(result == null){
            return "ok";
        }else{
            return "no";
        }
    }

    public void update(MemberDTO memberDTO)  throws IOException {
        MultipartFile memberPhoto = memberDTO.getMemberPhoto(); // 1.
        String memberProfile = memberPhoto.getOriginalFilename(); // 2.
        memberProfile = System.currentTimeMillis() + "-" + memberProfile; // 2.1.
        // 3.
        String savePath = "C:\\spring_img\\" + memberProfile; // 4.

        if (!memberPhoto.isEmpty()) {
            memberDTO.setMemberProfile(memberProfile);
            memberPhoto.transferTo(new File(savePath));
        }
        memberRepository.update(memberDTO);// 6.
    }

    public List<MemberDTO> findAll() {
       List<MemberDTO> memberDTO = memberRepository.findAll();
       return memberDTO;
    }

    public MemberDTO detail(Long id) {
       MemberDTO memberDTO = memberRepository.detail(id);
       return memberDTO;
    }

    public boolean delete(Long id) {
       int result = memberRepository.delete(id);
       if(result > 0){
           return true;
       }else{
           return false;
       }
    }
}
