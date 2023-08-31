package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class ResultDTO implements Serializable{
    private ArrayList<ResultBean> list;

    public ResultDTO(){
        list = new ArrayList<ResultBean>();
    }
    public void add (ResultBean rb){
        list.add(rb);
    }
    public ResultBean get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
