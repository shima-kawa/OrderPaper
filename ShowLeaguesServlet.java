import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.LeagueDTO;

@WebServlet("/showLeagues")
public class ShowLeaguesServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        LeagueDAO mdao = new LeagueDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        LeagueDTO ldto = mdao.select();
        // 検索結果をリクエストスコープに格納
        req.setAttribute("ldto", ldto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showleagues.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
