package com.its.memberBoard.repository;

import com.its.memberBoard.dtos.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int saveFile(MemberDTO memberDTO){
        return sql.insert("Member.saveFile",memberDTO);
    }
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicateCheck", memberId);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update",memberDTO);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public MemberDTO detail(Long id) {
        return sql.selectOne("Member.detail",id);
    }

    public int delete(Long id) {
        return sql.delete("Member.delete",id);
    }
}
