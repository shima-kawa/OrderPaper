import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import bean.MatchBean;
import bean.MatchDTO;
import bean.MemberIdBean;
import bean.TeamDTO;

@WebServlet("/checkmembers")
public class CheckMembersServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        TeamDTO opponenttdto = null; // 対戦相手用TeamDTO
        
        // リクエストの処理 - matchID
        req.setCharacterEncoding("utf-8");
        int matchId = Integer.parseInt(req.getParameter("matchId"));

        // リクエストの処理 - 出場選手
        String[] membersString = req.getParameterValues("player");
        int[] membersId = new int[6];
        MemberIdBean midb = new MemberIdBean();
        for(int i=0; i<membersString.length; i++){
            membersId[i] = Integer.parseInt(membersString[i]);
        }
        midb.setMemberId(membersId);

        // セッションOBからmyTeamの取得
        HttpSession session = req.getSession(true);
        int myTeamId = (int)session.getAttribute("myTeamId");

        // 自チームの取得
        TeamDAO tdao = new TeamDAO();
        TeamDTO mytdto = tdao.selectOneTeam(myTeamId);
        // 対戦相手の取得
        MatchDAO mdao = new MatchDAO();
        MatchDTO mdto = mdao.selectWhereMatchId(matchId);
        MatchBean mb = mdto.get(0);
        if(mb.getA() == myTeamId){
            opponenttdto = tdao.selectOneTeam(mb.getB());
        }
        else{
            opponenttdto = tdao.selectOneTeam(mb.getA());
        }

        

        // リクエストスコープに格納
        req.setAttribute("mytdto", mytdto);
        req.setAttribute("opponenttdto", opponenttdto);
        req.setAttribute("midb", midb);

        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/checkmembers.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
