package main.lxxmanagement.idao;

import main.lxxmanagement.model.Messages;

import java.util.List;

public interface iLSpaceDAO {

//
    public int insert(Messages messages);
//
//    public int update(Play play);
//
    public int delete(int ID);
//

    public List<Messages> select(String customerEmail,String method);
}
