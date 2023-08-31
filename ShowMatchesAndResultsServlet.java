import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/showMatchesAndResults")
public class ShowMatchesAndResultsServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        MatchDAO mdao = new MatchDAO();
        CortDAO cdao = new CortDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        MatchAndResultDTO mrdto = mdao.selectMatchesAndResults();
        CortDTO cdto = cdao.select();
        // コート毎に試合結果を格納するarrayオブジェクトの生成
        MatchAndResultArrayDTO mrArrayDto = new MatchAndResultArrayDTO();
        // 全コート毎に試合結果検索
        for(int corti=0; corti<cdto.size(); corti++){
            CortBean cb = cdto.get(corti);
            mrArrayDto.add(mdao.selectMatchesAndResultsWhereCortId(cb.getId())); 
        }
        // 検索結果をリクエストスコープに格納
        req.setAttribute("mrdto", mrdto);
        req.setAttribute("mrArrayDto", mrArrayDto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showmatchesandresults.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
