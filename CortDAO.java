import java.sql.*;
import bean.*;

public class CortDAO {
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

    public CortDTO select(){
        Statement stmt = null;
        ResultSet rs = null;
        CortDTO cdto = new CortDTO();
        String sql = "SELECT * FROM corts";
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                CortBean cb = new CortBean();
                cb.setId(rs.getInt("id"));
                cb.setName(rs.getString("name"));
                cdto.add(cb);
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

    public CortDTO selectOneCort(int cortId){
        Statement stmt = null;
        ResultSet rs = null;
        CortDTO cdto = new CortDTO();
        String sql = "SELECT * FROM corts WHERE id = " + cortId;
        try{
            connect();
            // 2.ステートメントを生成
            stmt = con.createStatement();
            // 3.SQLを実行
            rs = stmt.executeQuery(sql);
            // 4.検索結果の処理
            while(rs.next()){
                CortBean cb = new CortBean();
                cb.setId(rs.getInt("id"));
                cb.setName(rs.getString("name"));
                cdto.add(cb);
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

    public int insert(int id, String name){
        String sql = "INSERT INTO corts VALUES (" + id + ", '" + name + "')";
        return executeSql(sql);
    }

    public int update(int id, String name){
        String sql = "UPDATE corts SET id = " + id + ", name = '" + name + "' WHERE id = " + id;
        return executeSql(sql);
    }

    public int delete(int id){
        String sql = "DELETE FROM corts WHERE id = " + id;
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
