import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.CortDTO;

@WebServlet("/showCorts")
public class ShowCortsServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        CortDAO mdao = new CortDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        CortDTO cdto = mdao.select();
        // 検索結果をリクエストスコープに格納
        req.setAttribute("cdto", cdto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showcorts.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
