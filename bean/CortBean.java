package bean;

import java.io.Serializable;

public class CortBean implements Serializable{
    private int id;
    private String name;

    public CortBean(){
    }

    public void setId(int id){
        this.id = id;
    }
    public void setName(String name){
        this.name = name;
    }

    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
}
