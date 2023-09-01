import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import bean.MatchBean;
import bean.MatchDTO;
import bean.ResultBean;
import bean.TeamDTO;

@WebServlet("/checkResult")
public class CheckResultServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        
        // リクエストの処理
        req.setCharacterEncoding("utf-8");
        int gamecountA = Integer.parseInt(req.getParameter("gamecountA"));
        int gamecountB = Integer.parseInt(req.getParameter("gamecountB"));

        // DAO関係
        TeamDAO tdao = new TeamDAO();

        // セッションOBから試合情報の取得
        HttpSession session = req.getSession(true);
        MatchDTO mdto = (MatchDTO)session.getAttribute("mdto");
        MatchBean mb = mdto.get(0);
        session.removeAttribute("mdto");

        // ResultBeanに格納
        ResultBean rb = new ResultBean();
        rb.setId(mb.getId());
        if(gamecountA > gamecountB){
            rb.setWinner(mb.getA());
        }
        else{
            rb.setWinner(mb.getB());
        }
        rb.setGamecountA(gamecountA);
        rb.setGamecountB(gamecountB);

        // 試合に出場するチーム2つを取得
        TeamDTO tdtoA = tdao.selectOneTeam(mb.getA());
        TeamDTO tdtoB = tdao.selectOneTeam(mb.getB());
        TeamDTO tdto = new TeamDTO();
        tdto.add(tdtoA.get(0));
        tdto.add(tdtoB.get(0));

        // セッションOBに試合結果ResultBeanの格納
        session.setAttribute("rb", rb);

        // リクエストスコープに格納
        req.setAttribute("rb", rb);
        req.setAttribute("mb", mb);
        req.setAttribute("tdto", tdto);

        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/checkresult.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
