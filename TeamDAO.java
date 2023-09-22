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
        PreparedStatement ps = null;
        ResultSet rs = null;
        String[] players = new String[8];
        TeamDTO tdto = new TeamDTO();
        String sql = "SELECT * FROM teams WHERE id = ?";
        try{
            connect();
            // 2.ステートメントを生成
            ps = con.prepareStatement(sql);
            // 3.SQLを実行
            ps.setInt(1, id);
            rs = ps.executeQuery();
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
                if(ps != null) ps.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        disconnect();
        return tdto;
    }

    public TeamDTO selectOneTeam(String name){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String[] players = new String[8];
        TeamDTO tdto = new TeamDTO();
        String sql = "SELECT * FROM teams WHERE name = ?";
        try{
            connect();
            // 2.ステートメントを生成
            pstmt = con.prepareStatement(sql);
            // 3.SQLを実行
            pstmt.setString(1, name);
            rs = pstmt.executeQuery();
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
                if(pstmt != null) pstmt.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        disconnect();
        return tdto;
    }

    public TeamDTO selectWhereLeageId(int leagueId){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        TeamDTO tdto = new TeamDTO();
        String[] players = new String[8];
        String sql = "SELECT * FROM teams INNER JOIN team_league_relations ON teams.id = team_league_relations.team_id WHERE team_league_relations.league_id = ?";
        /* 
            SELECT * FROM teams
            INNER JOIN team_league_relations
                ON teams.id = team_league_relations.team_id
            WHERE team_league_relations.league_id = ?;
        */
        
        try {
            connect();
            // make stateante
            pstmt = con.prepareStatement(sql);
            // execute SQL
            pstmt.setInt(1, leagueId);
            rs = pstmt.executeQuery();
            // process for serched result
            while (rs.next()) {
                TeamBean tb = new TeamBean();
                tb.setId(rs.getInt("id"));
                tb.setName(rs.getString("name"));
                for(int i=1; i<=8; i++){
                    players[i-1] = rs.getString("player"+i);
                }
                tb.setPlayers(players);
                tdto.add(tb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        disconnect();
        return tdto;
    }

    public int insert(int id, String name, String[] players){
        PreparedStatement pstmt = null;
        int result = 0;

        String sql = "INSERT INTO teams VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try{
            connect();
            // ステートメントを生成
            pstmt = con.prepareStatement(sql);
            // SQL実行
            pstmt.setInt(1, id);
            pstmt.setString(2, name);
            for(int i=0; i<players.length; i++){
                pstmt.setString(3+i, players[i]);
            }
            result = pstmt.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            try{
                if(pstmt != null) pstmt.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        disconnect();
        return result;
    }

    public int update(int id, String name, String[] players){
        String sql = "UPDATE teams SET id=?, name = ?, player1=?, player2=?, player3=?, player4=?, player5=?, player6=?, player7=?, player8=? WHERE id = ?";
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            connect();
            // ステートメントを生成
            pstmt = con.prepareStatement(sql);
            // SQL実行
            pstmt.setInt(1, id);
            pstmt.setString(2, name);
            for(int i=0; i<players.length; i++){
                pstmt.setString(3+i, players[i]);
            }
            pstmt.setInt(11, id);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
        } finally{
            try {
                if(pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        disconnect();
        return result;
    }

    // preparedStatementにする？
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
