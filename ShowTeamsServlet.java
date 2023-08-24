import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.TeamDTO;

@WebServlet("/showTeams")
public class ShowTeamsServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        TeamDAO tdao = new TeamDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        TeamDTO tdto = tdao.select();
        // 検索結果をリクエストスコープに格納
        req.setAttribute("tdto", tdto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showteams.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
