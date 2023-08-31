package bean;

import java.io.Serializable;

public class ResultBean implements Serializable{
    private int id;
    private int winner;
    private int gamecountA;
    private int gamecountB;

    public ResultBean(){
    }

    public void setId(int id){
        this.id = id;
    }
    public void setWinner(int winner){
        this.winner = winner;
    }
    public void setGamecountA(int gamecountA){
        this.gamecountA = gamecountA;
    }
    public void setGamecountB(int gamecountB){
        this.gamecountB = gamecountB;
    }


    public int getId(){
        return id;
    }
    public int getWinner(){
        return winner;
    }
    public int getGamecountA(){
        return gamecountA;
    }
    public int getGamecountB(){
        return gamecountB;
    }
}
