import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.*;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        int myTeamId;

        // DAOオブジェクトを生成
        TeamDAO tdao = new TeamDAO();
        MatchDAO mdao  = new MatchDAO();
        // リクエストの文字コード指定
        req.setCharacterEncoding("utf-8");
        // 送信情報の取得・セッションオブジェクトに保存
        HttpSession session = req.getSession(true);
        myTeamId = Integer.parseInt(req.getParameter("myTeamId"));
        session.setAttribute("myTeamId", myTeamId);
        
        // 自チームの情報をTeamDTOとして取得
        TeamDTO mytdto = tdao.selectOneTeam(myTeamId);
        // 自チームの対戦情報をMatchDTOとして取得
        MatchDTO mdto = mdao.selectWhereTeam(myTeamId);
        
        // 自チームの対戦相手を全てTeamDTOとして取得
        TeamDTO opponents = new TeamDTO();
        TeamDTO tmp;
        for(int i=0; i<mdto.size(); i++){
            if(mdto.get(i).getA() == myTeamId){
                tmp = tdao.selectOneTeam(mdto.get(i).getB());
            }
            else{
                tmp = tdao.selectOneTeam(mdto.get(i).getA());
            }
            opponents.add(tmp.get(0));
        }

        // 取得した内容をリクエストスコープに格納
        req.setAttribute("mdto", mdto);
        req.setAttribute("opponents", opponents);
        req.setAttribute("mytdto", mytdto);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/registration.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
