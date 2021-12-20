package main.lxxmanagement.service;

import main.lxxmanagement.idao.DAOFactory;
import main.lxxmanagement.idao.iMessagesDAO;
import main.lxxmanagement.model.Messages;

import java.util.List;

public class MessagesSrv {

    private iMessagesDAO messagesDAO= DAOFactory.creatMessagesDAO();

    public int add(Messages messages){
        return messagesDAO.insert(messages);
    }
//
//    public int modify(Play play){
//        return employeeDAO.update(play);
//    }
//
    public int delete(int ID){
        return messagesDAO.delete(ID);
    }

    public List<Messages> Fetch(String email,String method){
        return messagesDAO.select(email,method);
    }
}
