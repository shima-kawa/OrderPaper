<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="rb" scope="request" class="bean.RegistrationBean" />
<jsp:useBean id="mytdto" scope="request" class="bean.TeamDTO" />
<jsp:useBean id="opponenttdto" scope="request" class="bean.TeamDTO" />
<%
    TeamBean mytb = mytdto.get(0);
    TeamBean opponenttb = opponenttdto.get(0);
    String[] players = mytb.getPlayers();
    int[] memberId = rb.getMemberId();
%>

<html>
<head>
    <title>選手確認 | <%= mytb.getName() %></title>
</head>
<body>
    <h2><%= mytb.getId() %> <%= mytb.getName() %>チーム</h2>
    <h2>下記内容を登録します</h2>
    <h2>ソフトテニス・オーダー票</h2>
    <table>
        <tr>
            <td>No.</td>
            <td>チーム名</td>
        </tr>
        <tr>
            <td><%= mytb.getId() %></td>
            <td><%= mytb.getName() %></td>
        </tr>
    </table>
    <p>第　　　回戦</P>
    <p><u>対　<%= opponenttb.getName() %>　戦用</u></p>
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
    <form action="/orderpaper/registeDB" method="post">
        <button type="button" onclick="history.back()">戻る</button>
        <input type="submit" value="登録">
    </form>
</body>
</html>