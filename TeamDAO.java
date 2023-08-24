import java.sql.*;
import bean.*;

public class TeamDAO {
    private final String URL = "jdbc:mysql://localhost/tennisfirst";
    private final String USER = "root";
    private final String PASS = "pass";
    private Connection con = null;

    public void connect(){
        try{
            // 1.DBに接続
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    public TeamDTO select(){
        Statement stmt = null;
        ResultSet rs = null;
        String[] players = new String[8];
        TeamDTO tdto = new TeamDTO();
        String sql = "SELECT * FROM teams";
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                TeamBean tb = new TeamBean();
                tb.setId(rs.getInt("id"));
                tb.setName(rs.getString("name"));
                for(int i=1; i<=8; i++){
                    players[i-1] = rs.getString("player"+i);
                }
                tb.setPlayers(players);
                tdto.add(tb);
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            try{
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        disconnect();
        return tdto;
    }

    public TeamDTO selectOneTeam(int id){
        Statement stmt = null;
        ResultSet rs = null;
        String[] players = new String[8];
        TeamDTO tdto = new TeamDTO();
        String sql = "SELECT * FROM teams WHERE id = " + id;
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                TeamBean tb = new TeamBean();
                tb.setId(rs.getInt("id"));
                tb.setName(rs.getString("name"));
                for(int i=1; i<=8; i++){
                    players[i-1] = rs.getString("player"+i);
                }
                tb.setPlayers(players);
                tdto.add(tb);
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            try{
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        disconnect();
        return tdto;
    }

    public TeamDTO selectOneTeam(String name){
        Statement stmt = null;
        ResultSet rs = null;
        String[] players = new String[8];
        TeamDTO tdto = new TeamDTO();
        String sql = "SELECT * FROM teams WHERE name = '" + name + "'";
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                TeamBean tb = new TeamBean();
                tb.setId(rs.getInt("id"));
                tb.setName(rs.getString("name"));
                for(int i=1; i<=8; i++){
                    players[i-1] = rs.getString("player"+i);
                }
                tb.setPlayers(players);
                tdto.add(tb);
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            try{
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        disconnect();
        return tdto;
    }
    public int insert(int id, String name, String[] players){
        String sql = "INSERT INTO teams VALUES (" + id + ", '" + name + "'";
        for(int i=0; i<players.length; i++){
            sql = sql + ", '" + players[i] + "'";
        }
        sql = sql + ")";
        return executeSql(sql);
    }

    public int update(int id, String name, String[] players){
        String sql = "UPDATE teams SET id = " + id + ", name = '" + name + "'";
        for(int i=0; i<players.length; i++){
            sql = sql + ", player" + (i+1) + " = '" + players[i] + "'";
        }
        sql = sql + " WHERE id = " + id;
        return executeSql(sql);
    }

    public int delete(int id){
        String sql = "DELETE FROM teams WHERE id = " + id;
        return executeSql(sql);
    }
    public int executeSql(String sql){
        Statement stmt = null;
        int result = 0;
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            result = stmt.executeUpdate(sql);
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            try{
                if(stmt != null) stmt.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        disconnect();
        return result;
    }
    public void disconnect(){
        try{
            // 5.DB切断
            if(con != null) con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
