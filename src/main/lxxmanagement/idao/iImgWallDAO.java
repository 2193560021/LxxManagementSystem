package main.lxxmanagement.idao;

import main.lxxmanagement.model.ImgWall;

import java.util.List;

public interface iImgWallDAO {

    public int delete(int ID);
//

    public List<ImgWall> select(String tel, String method);
}
