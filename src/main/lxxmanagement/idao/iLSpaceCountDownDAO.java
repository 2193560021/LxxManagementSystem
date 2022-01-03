package main.lxxmanagement.idao;

import main.lxxmanagement.model.LSpace;
import main.lxxmanagement.model.LSpaceCountDown;

import java.util.List;

public interface iLSpaceCountDownDAO {


    public int insert(LSpaceCountDown lSpaceCountDown);

    public int delete(int ID);

    public List<LSpaceCountDown> select(String customerTel);
}
