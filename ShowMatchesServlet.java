import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.MatchDTO;

@WebServlet("/showMatches")
public class ShowMatchesServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        MatchDAO mdao = new MatchDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        MatchDTO mdto = mdao.select();
        // 検索結果をリクエストスコープに格納
        req.setAttribute("mdto", mdto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showmatches.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
