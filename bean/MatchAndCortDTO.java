package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class MatchAndCortDTO implements Serializable{
    private ArrayList<MatchDTO> list;

    public MatchAndCortDTO(){
        list = new ArrayList<MatchDTO>();
    }
    public void add (MatchDTO mdto){
        list.add(mdto);
    }
    public MatchDTO get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
