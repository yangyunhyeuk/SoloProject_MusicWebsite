package com.yang.app.service;

import com.yang.app.vo.FavVO;

import java.util.List;

public interface FavService {
    boolean insertFav(FavVO vo);
    void deleteFav(FavVO vo);
    List<FavVO> getFavList(FavVO vo); // 해당 게시글에 대한 관심 게시글
    FavVO getFav(FavVO vo); // 특정 회원이 등록한 관심 게시글
    boolean isFav(FavVO vo); // 좋아요 표시 메서드
	int getTotalCount(final String mid);
	List<FavVO> getPageList(final String mid, final int page, final int size);

}
