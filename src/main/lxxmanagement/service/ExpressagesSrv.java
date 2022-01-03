package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iExpressagesDAO;
import main.lxxmanagement.idao.iMessagesDAO;
import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.Messages;

import java.util.List;

public class ExpressagesSrv {

    private iExpressagesDAO expressagesDAO= DAOFactory.creatExpressagesDAO();

    public int add(Expressages expressages){
        return expressagesDAO.insert(expressages);
    }

    public int delete(int ID){
        return expressagesDAO.delete(ID);
    }

    public List<Expressages> Fetch(String tel,String method){
        return expressagesDAO.select(tel,method);
    }

}
