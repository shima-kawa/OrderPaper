import java.sql.*;
import bean.*;

public class ResultDAO {
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

    public ResultDTO select(){
        Statement stmt = null;
        ResultSet rs = null;
        ResultDTO cdto = new ResultDTO();
        String sql = "SELECT * FROM results";
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                ResultBean rb = new ResultBean();
                rb.setId(rs.getInt("id"));
                rb.setWinner(rs.getInt("winner"));
                rb.setGamecountA(rs.getInt("gamecountA"));
                rb.setGamecountB(rs.getInt("gamecountB"));
                cdto.add(rb);
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
        return cdto;
    }

    public ResultDTO selectWhereMatchId(int matchId){
        Statement stmt = null;
        ResultSet rs = null;
        ResultDTO cdto = new ResultDTO();
        String sql = "SELECT * FROM results WHERE id = " + matchId;
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                ResultBean rb = new ResultBean();
                rb.setId(rs.getInt("id"));
                rb.setWinner(rs.getInt("winner"));
                rb.setGamecountA(rs.getInt("gamecountA"));
                rb.setGamecountB(rs.getInt("gamecountB"));
                cdto.add(rb);
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
        return cdto;
    }


    public int insert(int id, int winner, int gamecountA, int gamecountB){
        String sql ="INSERT INTO results VALUES(" + id + ", " + winner + ", " + gamecountA + ", "+ gamecountB + ")";
        return executeSql(sql);
    }
    public int update(int id, int winner, int gamecountA, int gamecountB){
        String sql = "UPDATE results SET id = " + id + ", winner = " + winner + ", gamecountA = "+ gamecountA + ", gamecountB = "+ gamecountB + " WHERE id = " + id;
        return executeSql(sql);
    }

    public int delete(int id){
        String sql = "DELETE FROM results WHERE id = " + id;
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
