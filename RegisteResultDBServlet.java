import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/registeResultDB")
public class RegisteResultDBServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // セッションOBから登録内容の呼び戻し
        HttpSession session = req.getSession(true);
        ResultBean rb = (ResultBean)session.getAttribute("rb");
        session.removeAttribute("rb");
        session.removeAttribute("mb");
        session.removeAttribute("tdto");
        
        // DAOオブジェクトを生成
        ResultDAO rdao = new ResultDAO();
        
        // DB登録
        rdao.insert(rb.getId(), rb.getWinner(), rb.getGamecountA(), rb.getGamecountB());

        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/registedb.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}