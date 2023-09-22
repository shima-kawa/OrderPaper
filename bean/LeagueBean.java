package bean;

import java.io.Serializable;

public class LeagueBean implements Serializable{
    private int leagueId;
    private String name;
    private int teamNum;

    public LeagueBean(){
    }

    public void setLeagueId(int leagueId){
        this.leagueId = leagueId;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setTeamNum(int teamNum){
        this.teamNum = teamNum;
    }

    public int getLeagueId(){
        return leagueId;
    }
    public String getName(){
        return name;
    }
    public int getTeamNum(){
        return teamNum;
    }
}
