package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iLSpaceCountDownDAO;
import main.lxxmanagement.idao.iLSpaceImgWallDAO;
import main.lxxmanagement.model.LSpaceCountDown;
import main.lxxmanagement.model.LSpaceImgWall;

import java.util.List;

public class LSpaceImgWallSrv {

    private iLSpaceImgWallDAO lSpaceImgWallDAO= DAOFactory.creatLSpaceImgWallDAO();

    public int delete(int ID){
        return lSpaceImgWallDAO.delete(ID);
    }


    public List<LSpaceImgWall> Fetch(String id){
        return lSpaceImgWallDAO.select(id);
    }
}
