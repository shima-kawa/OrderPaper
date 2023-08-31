import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.ResultDTO;

@WebServlet("/showResults")
public class ShowResultsServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        ResultDAO rdao = new ResultDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        ResultDTO rdto = rdao.select();
        // 検索結果をリクエストスコープに格納
        req.setAttribute("rdto", rdto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showresults.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
