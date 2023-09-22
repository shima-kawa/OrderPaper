<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="ldto" scope="request" class="bean.LeagueDTO" />
<html>
    <head>
        <title>リーグ一覧</title>
    </head>
    <body>
        <h2>全リーグの情報は次の通りです。</h2>
        <table border="0">
            <tr>
                <th>ID</th>
                <th>リーグ名</th>
                <th>num</th>
            </tr>
            <%
                for(int i=0; i<ldto.size(); i++){
                    LeagueBean lb = ldto.get(i);
            %>
                <tr>
                    <td align="center"><%= lb.getLeagueId() %></td>
                    <td align="center"><%= lb.getName() %></td>
                    <td align="center"><%= lb.getTeamNum() %></td>
                </tr>
            <% } %>
        </table>
    </body>
</html>