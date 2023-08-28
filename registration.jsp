<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="mdto" scope="request" class="bean.MatchDTO" />
<jsp:useBean id="opponents" scope="request" class="bean.TeamDTO" />
<jsp:useBean id="mytdto" scope="request" class="bean.TeamDTO" />
<%
    TeamBean mytb = mytdto.get(0);
    String[] players = mytb.getPlayers();
%>

<html>
<head>
    <title>選手登録 | <%= mytb.getName() %></title>
</head>
<body>
    <h2><%= mytb.getId() %> <%= mytb.getName() %>チーム</h2>
    <form action="/orderpaper/checkmembers" method="post">
        <h2>オーダーを送信する試合を選択してください。</h2>
        <select name="matchId" size="1">
            <% for(int matchi=0; matchi<mdto.size(); matchi++){
                MatchBean mb = mdto.get(matchi);
                TeamBean oppotb = opponents.get(matchi);
            %>
                <option value="<%= mb.getId() %>">matchid=<%= mb.getId() %>, <%= mb.getA() %>VS<%= mb.getB() %>　対　<%= oppotb.getName() %></option>
            <% } %>
        </select>
        <h2>試合に出場する選手を選択してください</h2>
        <table>
            <tr><th>試合番号</th><th>後衛サイド</th><th>前衛サイド</th></tr>
            <% for(int i=0; i<3; i++){%>
                <tr>
                <td><%= i+1 %></td>
                <% for(int j=0; j<2; j++){ %>
                    <td><select name="player" size="1">
                    <% for(int k=0; k<players.length; k++){ %>
                        <option value="<%= k %>"><%= players[k] %></option>
                    <% } %>
                    </select></td>
                <% } %>
                </tr>
            <% } %>
        </table>
        <input type="submit" value="送信">
    </form>
</body>
</html>