import java.sql.*;
import bean.*;

public class LeagueDAO {
    private final String URL ="jdbc:mysql://localhost/tennisfirst";
    private final String USER = "root";
    private final String PASS = "pass";
    private Connection con = null;

    public void connect(){
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public LeagueDTO select(){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LeagueDTO ldto = new LeagueDTO();
        String sql = "SELECT * FROM leagues";

        try {
            connect();
            // make statement
            pstmt = con.prepareStatement(sql);
            // execute SQL
            rs = pstmt.executeQuery();
            // process for serched result
            while (rs.next()) {
                LeagueBean lb = new LeagueBean();
                lb.setLeagueId(rs.getInt("league_id"));
                lb.setName(rs.getString("name"));
                lb.setTeamNum(rs.getInt("team_num"));
                ldto.add(lb);
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
        return ldto;
    }

    public void disconnect(){
        try {
            // disconnect DB
            if(con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
