package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class TeamArrayDTO implements Serializable{
    private ArrayList<TeamDTO> list;

    public TeamArrayDTO(){
        list = new ArrayList<TeamDTO>();
    }
    public void add (TeamDTO mdto){
        list.add(mdto);
    }
    public TeamDTO get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
