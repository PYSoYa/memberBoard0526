package com.its.memberBoard.dtos;

import lombok.Data;

@Data
public class PageDTO {
    private int page; // 현재페이지
    private int maxPage; // 최대페이지 갯수
    private int startPage; // 시작페이지
    private int endPage; // 끝페이지
}
