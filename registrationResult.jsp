<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="mdto" scope="request" class="bean.MatchDTO" />
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<%
    MatchBean mb = mdto.get(0);
    TeamBean teamA = tdto.get(0);
    TeamBean teamB = tdto.get(1);
%>

<html>
<head>
    <title>結果登録 | ID:<%= mb.getId() %></title>
</head>
<body>
    <h2>matchID<%= mb.getId() %>の結果を入力してください</h2>
    <h3><%= mb.getCort() %>コート・第N試合</h3>
    <form action="/orderpaper/checkResult" method="post">
        <table>
            <tr>
                <td align="center"><%= teamA.getName() %></td>
                <td align="center"><%= teamB.getName() %></td>
            </tr>
            <tr>
                <td align="center"><input type="number" name="gamecountA"></td>
                <td align="center"><input type="number" name="gamecountB"></td>
            </tr>
        </table>

        <input type="submit" value="送信">
    </form>
</body>
</html>