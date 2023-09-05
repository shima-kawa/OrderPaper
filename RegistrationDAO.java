import java.sql.*;
import bean.*;

public class RegistrationDAO {
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

    public RegistrationDTO select(){
        Statement stmt = null;
        ResultSet rs = null;
        RegistrationDTO rdto = new RegistrationDTO();
        String sql = "SELECT * FROM registrations";
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                int[] members = new int[6];
                RegistrationBean rb = new RegistrationBean();
                rb.setMatchId(rs.getInt("match_id"));
                rb.setTeamId(rs.getInt("team_id"));
                for(int i=0; i<6; i++){
                    members[i] = rs.getInt("player"+(i+1));
                }
                rb.setMemberId(members);
                rdto.add(rb);
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
        return rdto;
    }

    public RegistrationDTO selectWhereMatchId(int matchId){
        Statement stmt = null;
        ResultSet rs = null;
        RegistrationDTO rdto = new RegistrationDTO();
        String sql = "SELECT * FROM registrations WHERE match_id = " + matchId;
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                int[] members = new int[6];
                RegistrationBean rb = new RegistrationBean();
                rb.setMatchId(rs.getInt("match_id"));
                rb.setTeamId(rs.getInt("team_id"));
                for(int i=0; i<6; i++){
                    members[i] = rs.getInt("player"+(i+1));
                }
                rb.setMemberId(members);
                rdto.add(rb);
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
        return rdto;
    }

    public int insert(int match_id, int team_id, int[] memberId){
        String sql = "INSERT INTO registrations VALUES (" + match_id + ", " + team_id + "";
        for(int i=0; i<memberId.length; i++){
            sql = sql + ", " + memberId[i] + "";
        }
        sql = sql + ")";
        return executeSql(sql);
    }

    public int update(int match_id, int team_id, int[] memberId){
        String sql = "UPDATE registrations SET match_id = " + match_id + ", team_id = " + team_id;
        for(int i=0; i<memberId.length; i++){
            sql = sql + ", player" + (i+1) + "=" + memberId[i];
        }
        sql = sql + " WHERE match_id = " + match_id + "AND team_id = " + team_id;
        return executeSql(sql);
    }

    public int delete(int match_id, int team_id){
        String sql = "DELETE FROM registrations WHERE match_id = " + match_id + "AND team_id = " + team_id;
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
