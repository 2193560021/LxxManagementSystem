package main.lxxmanagement.idao;

import main.lxxmanagement.model.LSpace;

import java.util.List;

public interface iLSpaceDAO {



    public List<LSpace> select(String customerTel);
}
