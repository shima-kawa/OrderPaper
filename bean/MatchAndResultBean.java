package bean;
public class MatchAndResultBean extends MatchBean {
    private int winner;
    private int gamecountA;
    private int gamecountB;

    public MatchAndResultBean(){
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
