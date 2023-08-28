import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/showMatchesByTeam")
public class ShowMatchesByTeamServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        MatchDAO mdao = new MatchDAO();
        TeamDAO tdao = new TeamDAO();
        // チーム全体検索した結果をDTOオブジェクトとして取得
        TeamDTO tdto = tdao.select();
        // 全試合をチームごとに格納するオブジェクトの生成
        MatchArrayDTO madto = new MatchArrayDTO();
        // 全てのチームごとに試合を検索
        for(int i=0; i<tdto.size(); i++){
            TeamBean tb = tdto.get(i);
            MatchDTO mdto = mdao.selectWhereTeam(tb.getId());
            madto.add(mdto);
        }
        // すべてのチームと検索結果をリクエストスコープに格納
        req.setAttribute("tdto", tdto);
        req.setAttribute("madto", madto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showmatchesbyteam.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
