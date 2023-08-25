package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class MatchDTO implements Serializable{
    private ArrayList<MatchBean> list;

    public MatchDTO(){
        list = new ArrayList<MatchBean>();
    }
    public void add (MatchBean tb){
        list.add(tb);
    }
    public MatchBean get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
