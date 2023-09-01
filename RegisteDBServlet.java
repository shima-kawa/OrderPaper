import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/registeDB")
public class RegisteDBServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // セッションOBから登録内容の呼び戻し
        HttpSession session = req.getSession(true);
        RegistrationBean rb = (RegistrationBean)session.getAttribute("registrationBean");
        
        // DAOオブジェクトを生成
        RegistrationDAO rdao = new RegistrationDAO();
        
        // DB登録
        rdao.insert(rb.getMatchId(), rb.getTeamId(), rb.getMemberId());

        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/registedb.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
