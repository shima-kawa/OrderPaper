package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class CortDTO implements Serializable{
    private ArrayList<CortBean> list;

    public CortDTO(){
        list = new ArrayList<CortBean>();
    }
    public void add (CortBean cb){
        list.add(cb);
    }
    public CortBean get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
