import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/showLeagues")
public class ShowLeaguesServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        LeagueDAO ldao = new LeagueDAO();
        TeamDAO tdao = new TeamDAO();
        MatchDAO mdao = new MatchDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        LeagueDTO ldto = ldao.select();
        // リーグごとにteamを検索
        TeamArrayDTO tdtoArraydto = new TeamArrayDTO();
        for(int i=0; i<ldto.size(); i++){
            LeagueBean lb = ldto.get(i);
            tdtoArraydto.add(tdao.selectWhereLeageId(lb.getLeagueId())); 
        }
        // リザルト検索
        MatchAndResultArrayDTO maradto = new MatchAndResultArrayDTO();
        for(int i=0; i<ldto.size(); i++){
            LeagueBean lb = ldto.get(i);
            MatchAndResultDTO forwardedMardto = new MatchAndResultDTO();
            for(int childRow=1; childRow<=lb.getTeamNum(); childRow++){
                for(int childCol=childRow+1; childCol<=lb.getTeamNum(); childCol++){
                    // リーグIDとchildIDで、1試合ずつ検索、mardtoに追加
                    MatchDTO mdto = mdao.selectWhereLeagueIdAndLeagueChildIdab(lb.getLeagueId(), childRow, childCol);
                    if(mdto.size() != 0){
                        MatchBean mb = mdto.get(0);
                        MatchAndResultDTO mardto = mdao.selectMatchesAndResultsWhereMatchId(mb.getId());
                        forwardedMardto.add(mardto.get(0));
                    }
                    else{
                        MatchAndResultBean mb = new MatchAndResultBean();
                        mb.setId(0);
                        mb.setcort(0);
                        mb.setA(0);
                        mb.setB(0);
                        forwardedMardto.add(mb);
                    }
                }
            }
            maradto.add(forwardedMardto);
        }

        // 検索結果をリクエストスコープに格納
        req.setAttribute("ldto", ldto);
        req.setAttribute("tdtoArraydto", tdtoArraydto);
        req.setAttribute("maradto", maradto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showleagues.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
