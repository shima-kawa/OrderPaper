import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        int myTeamId;

        // DAOオブジェクトを生成
        TeamDAO tdao = new TeamDAO();
        // リクエストの文字コード指定
        req.setCharacterEncoding("utf-8");
        // 送信情報の取得・セッションオブジェクトに保存
        HttpSession session = req.getSession(true);
        myTeamId = Integer.parseInt(req.getParameter("myTeamId"));
        session.setAttribute("myTeamId", myTeamId);
        
        // 自チームのIDをDTOオブジェクトとして取得
        TeamDTO tdto = tdao.selectOneTeam(myTeamId);
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
