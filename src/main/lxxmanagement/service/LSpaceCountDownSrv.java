package main.lxxmanagement.service;

import main.lxxmanagement.dao.LSpaceCountDownDAO;
import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iLSpaceCountDownDAO;
import main.lxxmanagement.idao.iLSpaceDAO;
import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.LSpace;
import main.lxxmanagement.model.LSpaceCountDown;

import java.util.List;

public class LSpaceCountDownSrv {

    private iLSpaceCountDownDAO lSpaceCountDownDAO= DAOFactory.creatLSpaceCountDownDAO();

    public int add(LSpaceCountDown lSpaceCountDown){
        return lSpaceCountDownDAO.insert(lSpaceCountDown);
    }

    public int delete(int ID){
        return lSpaceCountDownDAO.delete(ID);
    }


    public List<LSpaceCountDown> Fetch(String tel){
        return lSpaceCountDownDAO.select(tel);
    }
}
