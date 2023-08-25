import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import bean.MemberIdBean;
import bean.TeamDTO;

@WebServlet("/checkmembers")
public class CheckMembersServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // リクエストの処理
        req.setCharacterEncoding("utf-8");
        String[] membersString = req.getParameterValues("player");
        int[] membersId = new int[6];
        MemberIdBean midb = new MemberIdBean();
        for(int i=0; i<membersString.length; i++){
            membersId[i] = Integer.parseInt(membersString[i]);
        }
        midb.setMemberId(membersId);

        // セッションOBからmyTeamの取得
        HttpSession session = req.getSession(true);
        String myTeam = (String)session.getAttribute("myTeam");

        // DB関係
        TeamDAO tdao = new TeamDAO();
        TeamDTO tdto = tdao.selectOneTeam(myTeam);

        // リクエストスコープに格納
        req.setAttribute("midb", midb);
        req.setAttribute("tdto", tdto);

        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/checkmembers.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
