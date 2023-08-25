import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/sessionPlayer")
public class SessionServletSelectPlayer extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        // セッションオブジェクトの生成or取得
        HttpSession session = req.getSession(true);

        // セッションオブジェクトからcartを取得
        String[] playerlist = (String[]) session.getAttribute("player");

        if (playerlist == null) {
            playerlist = new String[6];
            for (int i = 0; i < 6; i++) {
                playerlist[i] = "please select";
            }
        } else {
            req.setCharacterEncoding("utf-8");
            String[] player = req.getParameterValues("player");
            for (int i = 0; i < player.length; i++) {
                playerlist[i] = player[i];
            }
        }
        session.setAttribute("player", playerlist);

        res.setContentType("text/html;charset=utf-8");
        PrintWriter out = res.getWriter();
        out.println("<html><head>");
        out.println("<title>選手登録</title>");
        out.println("</head><body>");
        out.println("<h2>試合に出場する選手を選択してください</h2>");
        out.println("<form action=\"/javaweb/sessionPlayer\" method=\"post\">");
        out.println("<table>");
        out.println("<tr><th>試合番号</th><th>後衛サイド</th><th>前衛サイド</th></tr>");
        for (int i = 0; i < 3; i++) {
            out.println("<tr><td>" + (i + 1) + "</td>");

            for (int j = 0; j < 2; j++) {
                out.println("<td>");
                out.println("<select name=\"player\" size=\"1\">");
                for (int k = 1; k <= 8; k++) {
                    if(playerlist[i*2+j].equals("please select")){
                        out.println("<option value=\"\" selected hidden>選択してください</option>");
                    }
                    if (playerlist[i * 2 + j].equals("player" + k)) {
                        out.println("<option value=\"player" + k + "\" selected>選手" + k + "</option>");
                    } else {
                        out.println("<option value=\"player" + k + "\">選手" + k + "</option>");
                    }
                }
                out.println("</select></td>");
            }
            out.println("</tr>");
        }
        out.println("</table>");
        out.println("<input type=\"submit\" value=\"更新\"></form>");
        out.println("<h2>選手一覧</h2>");

        out.println("<table>");
        out.println("<tr><th>試合番号</th><th>後衛サイド</th><th>前衛サイド</th></tr>");
        for (int i = 0; i < 3; i++) {
            out.println("<tr><td>" + (i + 1) + "</td><td>" + playerlist[i * 2] + "</td><td>" + playerlist[i * 2 + 1]
                    + "</td></tr>");
        }
        out.println("</table>");
        out.println("</body></html>");
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doPost(req, res);
    }
}
