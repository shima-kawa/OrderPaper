import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/showLeagues")
public class ShowLeaguesServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        LeagueDAO mdao = new LeagueDAO();
        TeamDAO tdao = new TeamDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        LeagueDTO ldto = mdao.select();
        // リーグごとにteamを検索
        TeamArrayDTO tdtoArraydto = new TeamArrayDTO();
        for(int i=0; i<ldto.size(); i++){
            LeagueBean lb = ldto.get(i);
            tdtoArraydto.add(tdao.selectWhereLeageId(lb.getLeagueId())); 
        }
        // 検索結果をリクエストスコープに格納
        req.setAttribute("ldto", ldto);
        req.setAttribute("tdtoArraydto", tdtoArraydto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showleagues.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
