package bean;

import java.io.Serializable;

public class MatchBean implements Serializable{
    private int id;
    private int cort;
    private int a;
    private int b;

    public MatchBean(){
    }

    public void setId(int id){
        this.id = id;
    }
    public void setcort(int cort){
        this.cort = cort;
    }
    public void setA(int a){
        this.a = a;
    }
    public void setB(int b){
        this.b = b;
    }

    public int getId(){
        return id;
    }
    public int getCort(){
        return cort;
    }
    public int getA(){
        return a;
    }
    public int getB(){
        return b;
    }
}
