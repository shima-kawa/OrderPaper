<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="midb" scope="request" class="bean.MemberIdBean" />
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<%
    TeamBean tb = tdto.get(0);
    String[] players = tb.getPlayers();
    int[] memberId = midb.getMemberId();
%>

<html>
<head>
    <title>選手確認 | <%= tb.getName() %></title>
</head>
<body>
    <h2><%= tb.getId() %> <%= tb.getName() %>チーム</h2>
    <h2>下記内容を登録します</h2>
    <h2>ソフトテニス・オーダー票</h2>
    <table>
        <tr>
            <td>No.</td>
            <td>チーム名</td>
        </tr>
        <tr>
            <td><%= tb.getId() %></td>
            <td><%= tb.getName() %></td>
        </tr>
    </table>
    <p>第　　　回戦</P>
    <p>対　　　　　　戦用</p>
    <table>
        <!---- <tr><th>試合番号</th><th>後衛サイド</th><th>前衛サイド</th></tr> --->
        <% for(int i=0; i<3; i++){%>
            <tr>
                <td><%= i+1 %></td>
                <td><%= players[memberId[i*2]] %></td>
                <td><%= players[memberId[i*2+1]] %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>