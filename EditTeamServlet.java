import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.TeamDTO;

@WebServlet("/editTeam")
public class EditTeamServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        String msg="参加チームの情報を表示します";
        // 入力値（btn）を取得
        req.setCharacterEncoding("utf-8");
        String btn = req.getParameter("btn");
        // DAOオブジェクトを生成
        TeamDAO tdao = new TeamDAO();
        // 押下ボタンによる分岐処理
        if(btn.equals("追加")){
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String[] players = req.getParameterValues("playerName");
            tdao.insert(id, name, players);
            msg = "ID" + id + "のチームを追加しました";
        }
        else if(btn.equals("修正")){
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String[] players = req.getParameterValues("playerName");
            tdao.update(id, name, players);
            msg = "ID" + id + "のチームを修正しました";
        }
        else if(btn.equals("削除")){
            int id = Integer.parseInt(req.getParameter("id"));
            tdao.delete(id);
            msg = "ID" + id + "のチームを削除しました";
        }
        // 全体検索
        TeamDTO tdto = tdao.select();
        // 検索結果をリクエストスコープに格納
        req.setAttribute("tdto", tdto);
        req.setAttribute("msg", msg);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/editteam.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
