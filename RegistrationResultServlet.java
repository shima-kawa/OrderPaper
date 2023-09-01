import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/registeResult")
public class RegistrationResultServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        MatchDAO mdao = new MatchDAO();
        TeamDAO tdao = new TeamDAO();

        // リクエストの文字コード指定
        req.setCharacterEncoding("utf-8");

        // 送信情報の取得
        int matchId = Integer.parseInt(req.getParameter("matchId"));
        
        // 試合情報をMatchDTOとして取得・セッションOBに格納
        MatchDTO mdto = mdao.selectWhereMatchId(matchId);
        HttpSession session = req.getSession(true);
        session.setAttribute("mdto", mdto); 
        
        // 試合に出場するチーム2つを取得
        MatchBean mb = mdto.get(0);
        TeamDTO tdtoA = tdao.selectOneTeam(mb.getA());
        TeamDTO tdtoB = tdao.selectOneTeam(mb.getB());
        TeamDTO tdto = new TeamDTO();
        tdto.add(tdtoA.get(0));
        tdto.add(tdtoB.get(0));

        // 取得した内容をリクエストスコープに格納
        req.setAttribute("mdto", mdto);
        req.setAttribute("tdto", tdto);

        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/registrationResult.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
