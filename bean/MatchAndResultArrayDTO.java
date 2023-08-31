package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class MatchAndResultArrayDTO implements Serializable{
    private ArrayList<MatchAndResultDTO> list;

    public MatchAndResultArrayDTO(){
        list = new ArrayList<MatchAndResultDTO>();
    }
    public void add (MatchAndResultDTO mdto){
        list.add(mdto);
    }
    public MatchAndResultDTO get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
