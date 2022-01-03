package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iLSpaceDAO;
import main.lxxmanagement.idao.iMessagesDAO;
import main.lxxmanagement.model.LSpace;
import main.lxxmanagement.model.Messages;

import java.util.List;

public class LSpaceSrv {

    private iLSpaceDAO lSpaceDAO= DAOFactory.creatLSpaceDAO();


    public List<LSpace> Fetch(String tel){
        return lSpaceDAO.select(tel);
    }
}
