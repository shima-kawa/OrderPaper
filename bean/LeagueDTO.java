package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class LeagueDTO implements Serializable{
    private ArrayList<LeagueBean> list;

    public LeagueDTO(){
        list = new ArrayList<LeagueBean>();
    }
    public void add (LeagueBean lb){
        list.add(lb);
    }
    public LeagueBean get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
