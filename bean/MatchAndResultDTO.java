package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class MatchAndResultDTO implements Serializable{
    private ArrayList<MatchAndResultBean> list;

    public MatchAndResultDTO(){
        list = new ArrayList<MatchAndResultBean>();
    }
    public void add (MatchAndResultBean mrb){
        list.add(mrb);
    }
    public MatchAndResultBean get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
