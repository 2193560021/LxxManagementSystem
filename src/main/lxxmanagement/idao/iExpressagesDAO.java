package main.lxxmanagement.idao;

import main.lxxmanagement.model.Expressages;
import main.lxxmanagement.model.Messages;
import main.lxxmanagement.service.ExpressagesSrv;

import java.util.List;

public interface iExpressagesDAO {

//
    public int insert(Expressages expressages);
//
//    public int update(Play play);
//
    public int delete(int ID);
//

    public List<Expressages> select(String tel, String method);
}
