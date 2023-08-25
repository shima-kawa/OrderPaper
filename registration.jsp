<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<%
    TeamBean tb = tdto.get(0);
    String[] players = tb.getPlayers();
%>

<html>
<head>
    <title>選手登録 | <%= tb.getName() %></title>
</head>
<body>
    <h2><%= tb.getId() %> <%= tb.getName() %>チーム</h2>
    <h2>試合に出場する選手を選択してください</h2>
    <form action="/orderpaper/checkmembers" method="post">
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