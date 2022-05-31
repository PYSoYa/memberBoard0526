package com.its.memberBoard.service;

import com.its.memberBoard.dtos.BoardDTO;
import com.its.memberBoard.dtos.PageDTO;
import com.its.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id) {
        BoardDTO boardDTO = boardRepository.findById(id);
        return boardDTO;
    }

    public void saveFile(BoardDTO boardDTO) throws IOException {

        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;

        String savePath = "D:\\spring_img\\" + boardFileName;

        if (!boardFile.isEmpty()) {
            boardDTO.setBoardFileName(boardFileName);
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.saveFile(boardDTO);
    }


    private static final int PAGE_LIMIT = 5;
    private static final int BLOCK_LIMIT = 3;
    /*
        요청한 페이지에 해당하는 글 목록을 DB에서 가져오는 역할
     */
    public List<BoardDTO> pagingList(int page) {
        // 1페이지 요청 =>
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }
    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;
    }

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount();
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;

        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }




    public boolean update(BoardDTO boardDTO) {
       int result = boardRepository.update(boardDTO);
       if(result > 0){
           return true;
       }else{
           return false;
       }
    }

    public boolean delete(Long id) {
       int result = boardRepository.delete(id);
       if(result > 0){
           return true;
       }else{
           return false;
       }
    }
}
