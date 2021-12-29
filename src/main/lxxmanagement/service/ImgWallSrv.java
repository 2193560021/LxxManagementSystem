package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iImgWallDAO;
import main.lxxmanagement.model.ImgWall;

import java.util.List;

public class ImgWallSrv {

    private iImgWallDAO iImgWallDAO= DAOFactory.creatImgWallDAO();

//    public int modify(Play play){
//        return employeeDAO.update(play);
//    }
//
    public int delete(int ID){
        return iImgWallDAO.delete(ID);
    }

    public List<ImgWall> Fetch(String tel, String method){
        return iImgWallDAO.select(tel,method);
    }

}
