import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import bean.MatchBean;
import bean.MatchDTO;
import bean.RegistrationBean;
import bean.TeamDTO;

@WebServlet("/checkmembers")
public class CheckMembersServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        RegistrationBean rb = new RegistrationBean();

        TeamDTO opponenttdto = null; // 対戦相手用TeamDTO
        
        // リクエストの処理 - matchID
        req.setCharacterEncoding("utf-8");
        rb.setMatchId(Integer.parseInt(req.getParameter("matchId")));

        // リクエストの処理 - 出場選手
        String[] membersString = req.getParameterValues("player");
        int[] membersId = new int[6];
        for(int i=0; i<membersString.length; i++){
            membersId[i] = Integer.parseInt(membersString[i]);
        }
        rb.setMemberId(membersId);

        // セッションOBからmyTeamの取得
        HttpSession session = req.getSession(true);
        rb.setTeamId((int)session.getAttribute("myTeamId"));

        // 自チームの取得
        TeamDAO tdao = new TeamDAO();
        TeamDTO mytdto = tdao.selectOneTeam(rb.getTeamId());
        // 対戦相手の取得
        MatchDAO mdao = new MatchDAO();
        MatchDTO mdto = mdao.selectWhereMatchId(rb.getMatchId());
        MatchBean mb = mdto.get(0);
        if(mb.getA() == rb.getTeamId()){
            opponenttdto = tdao.selectOneTeam(mb.getB());
        }
        else{
            opponenttdto = tdao.selectOneTeam(mb.getA());
        }

        // rbをセッションOBに格納
        session.setAttribute("registrationBean", rb);

        // リクエストスコープに格納
        req.setAttribute("mytdto", mytdto);
        req.setAttribute("opponenttdto", opponenttdto);
        req.setAttribute("rb", rb);

        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/checkmembers.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
