<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="rb" scope="request" class="bean.ResultBean" />
<jsp:useBean id="mb" scope="request" class="bean.MatchBean" />
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<%
    TeamBean teamA = tdto.get(0);
    TeamBean teamB = tdto.get(1);
%>

<html>
<head>
    <title>結果確認 | </title>
</head>
<body>
    <h2>下記内容を登録します</h2>
    <h3><%= mb.getCort() %>コート・第N試合</h3>
    <table>
        <tr>
            <td align="center"><%= mb.getA() %><%= teamA.getName() %></td>
            <td align="center"><%= mb.getB() %><%= teamB.getName() %></td>
        </tr>
        <tr>
            <td align="center"><%= rb.getGamecountA() %></td>
            <td align="center"><%= rb.getGamecountB() %></td>
        </tr>
    </table>
    <%= rb.getWinner() %>の勝利
    <form action="/orderpaper/registeResultDB" method="post">
        <button type="button" onclick="history.back()">戻る</button>
        <input type="submit" value="登録">
    </form>

</body>
</html>