<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<html>
    <head>
        <title>表示画面</title>
    </head>
    <body>
        <h2>参加選手の情報は次の通りです。</h2>
        <table border="0">
            <tr>
                <th width="50">ID</th>
                <th width="100">チーム名</th>
                <th width="130">選手1</th>
                <th width="130">選手2</th>
                <th width="130">選手3</th>
                <th width="130">選手4</th>
                <th width="130">選手5</th>
                <th width="130">選手6</th>
                <th width="130">選手7</th>
                <th width="130">選手8</th>
            </tr>
            <%
                for(int i=0; i<tdto.size(); i++){
                    TeamBean tb = tdto.get(i);
                    String[] players = tb.getPlayers();
            %>
            <tr>
                <td align="center"><%= tb.getId() %></td>
                <td align="center"><%= tb.getName() %></td>
                <% for(int j=0; j<players.length; j++){ %>
                    <td align="center"><%= players[j] %></td>
                <% } %>
            </tr>
            <% } %>
        </table>
    </body>
</html>