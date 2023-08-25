import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        TeamDAO tdao = new TeamDAO();
        // リクエストの文字コード指定
        req.setCharacterEncoding("utf-8");
        // 送信情報の取得・セッションオブジェクトに保存
        HttpSession session = req.getSession(true);
        String myTeam = (String) session.getAttribute("myTeam");
        myTeam = req.getParameter("myTeam");
        session.setAttribute("myTeam", myTeam);
        
        // 自チームの情報をDTOオブジェクトとして取得
        TeamDTO tdto = tdao.selectOneTeam(myTeam);
        // 取得した内容をリクエストスコープに格納
        req.setAttribute("tdto", tdto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/registration.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
