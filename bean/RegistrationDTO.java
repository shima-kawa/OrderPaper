package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class RegistrationDTO implements Serializable{
    private ArrayList<RegistrationBean> list;

    public RegistrationDTO(){
        list = new ArrayList<RegistrationBean>();
    }
    public void add (RegistrationBean rb){
        list.add(rb);
    }
    public RegistrationBean get(int i){
        return list.get(i);
    }
    public int size(){
        return list.size();
    }
}
