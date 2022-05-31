package com.its.memberBoard.repository;

import com.its.memberBoard.dtos.BoardDTO;
import com.its.memberBoard.service.BoardService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public void saveFile(BoardDTO boardDTO) {
        sql.insert("Board.saveFile", boardDTO);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }


    public BoardDTO findById(Long id) {
        sql.update("Board.updateHits",id);
        return sql.selectOne("Board.detail",id);
    }

    public int update(BoardDTO boardDTO) {
        return sql.update("Board.update",boardDTO);
    }

    public int delete(Long id) {
        return sql.delete("Board.delete",id);
    }
}
