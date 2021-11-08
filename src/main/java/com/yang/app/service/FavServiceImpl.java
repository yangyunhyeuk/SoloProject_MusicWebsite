package com.yang.app.service;

import com.yang.app.dao.FavDAO;
import com.yang.app.vo.FavVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("favService")
public class FavServiceImpl implements FavService {

    @Autowired
    private FavDAO fDAO;

    @Override
    public boolean insertFav(FavVO vo) {
        // TODO Auto-generated method stub
        try {
            fDAO.insertFav(vo);
            return true;
        } catch (Exception e) {
            System.out.println("에러 발생");
            return false;
        } finally {
            System.out.println("insertFav 예외 처리 중");
        }
    }

    @Override
    public void deleteFav(FavVO vo) {
        // TODO Auto-generated method stub
        fDAO.deleteFav(vo);
    }

    @Override
    public List<FavVO> getFavList(FavVO vo) {
        // TODO Auto-generated method stub
        return fDAO.getFavList(vo);
    }

    @Override
    public FavVO getFav(FavVO vo) {
        // TODO Auto-generated method stub
        try {
            return fDAO.getFav(vo);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean isFav(FavVO vo) {
        return fDAO.isFav(vo);
    }

    @Override
    public int getTotalCount(final String mid) {
        return fDAO.getTotalCount(mid);
    }

    @Override
    public List<FavVO> getPageList(String mid, int page, int size) {
        return fDAO.getPageList(mid, page, size);
    }

}
