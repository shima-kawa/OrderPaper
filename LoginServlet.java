import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/sessionLogin")
public class LoginServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        // セッションオブジェクトの生成or取得
        HttpSession session = req.getSession(true);

        // セッションオブジェクトから所属チームidを取得
        Integer myTeamId = (Integer)session.getAttribute("myTeamId");

        if(myTeamId == null){
            myTeamId = 0;
        }
        else{
            req.setCharacterEncoding("utf-8");
            
        }
    }
}
