import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/showMatchesByCort")
public class ShowMatchesByCortServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        MatchDAO mdao = new MatchDAO();
        CortDAO cdao = new CortDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        CortDTO cdto = cdao.select();
        // 全試合をコートごとに格納するオブジェクトの生成
        MatchArrayDTO madto = new MatchArrayDTO();
        // 全てのコートごとに試合を検索
        for(int i=0; i<cdto.size(); i++){
            CortBean cb = cdto.get(i);
            MatchDTO mdto = mdao.select(cb.getId());
            madto.add(mdto);
        }
        // 検索結果をリクエストスコープに格納
        req.setAttribute("madto", madto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showmatchesbycort.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
