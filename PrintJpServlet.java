import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/printJp")
public class PrintJpServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        
        // DAOオブジェクトを生成
        RegistrationDAO rdao = new RegistrationDAO();
        TeamDAO tdao = new TeamDAO();
        MatchDAO mdao = new MatchDAO();
        
        // リクエスト処理
        req.setCharacterEncoding("utf-8");
        int matchId = Integer.parseInt(req.getParameter("matchId"));

        // DBアクセス
        MatchDTO mdto = mdao.selectWhereMatchId(matchId);
        MatchBean mb = mdto.get(0);
        TeamDTO tdtoA = tdao.selectOneTeam(mb.getA());
        TeamDTO tdtoB = tdao.selectOneTeam(mb.getB());
        TeamDTO tdto = new TeamDTO();
        tdto.add(tdtoA.get(0));
        tdto.add(tdtoB.get(0));
        RegistrationDTO rdto = rdao.selectWhereMatchId(matchId);
        // 要確認 tdto, rdtoの中身の順番が確実にmatchのA,Bの順番になっているのか。

        // reqに格納
        req.setAttribute("mdto", mdto);
        req.setAttribute("tdto", tdto);
        req.setAttribute("rdto", rdto);

        // JSPにフォワード
        if(rdto.size() == 2){
            RequestDispatcher rd = req.getRequestDispatcher("/printjp.jsp");
            rd.forward(req, res);
        }
        else{
            RequestDispatcher rd = req.getRequestDispatcher("/notsubmitted.jsp");
            rd.forward(req, res);
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}