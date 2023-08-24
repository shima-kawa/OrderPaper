package bean;

import java.io.Serializable;

public class TeamBean implements Serializable{
    private int id;
    private String name;
    private String[] players;

    public TeamBean(){
        players = new String[8];
    }

    public void setId(int id){
        this.id = id;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setPlayers(String[] players){
        for(int i=0; i<players.length; i++){
            this.players[i] = players[i];
        }
    }

    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public String[] getPlayers(){
        return players;
    }
}
