import java.sql.*;
import bean.*;

public class MatchDAO {
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

    public MatchDTO select(){
        Statement stmt = null;
        ResultSet rs = null;
        MatchDTO mdto = new MatchDTO();
        String sql = "SELECT * FROM matches";
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                MatchBean tb = new MatchBean();
                tb.setId(rs.getInt("id"));
                tb.setcort(rs.getInt("cort"));
                tb.setA(rs.getInt("A"));
                tb.setB(rs.getInt("B"));
                mdto.add(tb);
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
        return mdto;
    }

    public MatchDTO select(int cortId){
        Statement stmt = null;
        ResultSet rs = null;
        MatchDTO mdto = new MatchDTO();
        String sql = "SELECT * FROM matches WHERE cort = " + cortId;
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                MatchBean tb = new MatchBean();
                tb.setId(rs.getInt("id"));
                tb.setcort(rs.getInt("cort"));
                tb.setA(rs.getInt("A"));
                tb.setB(rs.getInt("B"));
                mdto.add(tb);
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
        return mdto;
    }

    public MatchDTO selectWhereTeam(int teamId){
        Statement stmt = null;
        ResultSet rs = null;
        MatchDTO mdto = new MatchDTO();
        String sql = "SELECT * FROM matches WHERE a = " + teamId + " OR b = " + teamId;
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                MatchBean mb = new MatchBean();
                mb.setId(rs.getInt("id"));
                mb.setcort(rs.getInt("cort"));
                mb.setA(rs.getInt("A"));
                mb.setB(rs.getInt("B"));
                mdto.add(mb);
            } 
        }catch(Exception e){
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
        return mdto;
    }

    public int insert(int id, int cort, int a, int b){
        String sql = "INSERT INTO matches VALUES (" + id + ", " + cort + ", " + a + ", " + b + ")";
        return executeSql(sql);
    }

    public int update(int id, int cort, int a, int b){
        String sql = "UPDATE matches SET id = " + id + ", cort = " + cort + ", A = " + a + ", B = " + b + "WHERE id = " + id;
        return executeSql(sql);
    }


    public int delete(int id){
        String sql = "DELETE FROM matches WHERE id = " + id;
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
