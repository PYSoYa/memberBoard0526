package com.its.memberBoard.service;

import com.its.memberBoard.dtos.MemberDTO;
import com.its.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public boolean save(MemberDTO memberDTO) {
       int result = memberRepository.save(memberDTO);
       if(result > 0){
           return true;
       }else{
           return false;
       }
    }
}
