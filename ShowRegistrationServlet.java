import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import bean.RegistrationDTO;
import bean.TeamDTO;

@WebServlet("/showRegistration")
public class ShowRegistrationServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        // DAOオブジェクトを生成
        TeamDAO tdao = new TeamDAO();
        RegistrationDAO rdao = new RegistrationDAO();
        // 全体検索した結果をDTOオブジェクトとして取得
        TeamDTO tdto = tdao.select();
        RegistrationDTO rdto = rdao.select();
        // registrationの順番にteamを格納して、フォワードすることにする
        // - rdtoとtdtoForForwardのチーム情報は同じindexで紐づくようにする
        TeamDTO tdtoForForward = new TeamDTO();
        for(int i=0; i<rdto.size(); i++){
            int j=0;
            while(tdto.get(j).getId() != rdto.get(i).getTeamId()){
                j++;
                if(j > tdto.size()) throw new IOException(); //tekitou
            }
            tdtoForForward.add(tdto.get(j));
        }
        // 検索結果をリクエストスコープに格納
        req.setAttribute("rdto", rdto);
        req.setAttribute("tdtoForForward", tdtoForForward);
        // JSPにフォワード
        RequestDispatcher rd = req.getRequestDispatcher("/showregistrations.jsp");
        rd.forward(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
