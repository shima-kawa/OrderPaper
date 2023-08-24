package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class TeamDTO implements Serializable{
    private ArrayList<TeamBean> list;

    public TeamDTO(){
        list = new ArrayList<TeamBean>();
    }
    public void add (TeamBean tb){
        list.add(tb);
    }
    public TeamBean get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
