<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="ldto" scope="request" class="bean.LeagueDTO" />
<jsp:useBean id="tdtoArraydto" scope="request" class="bean.TeamArrayDTO" />
<html>
    <head>
        <title>リーグ一覧</title>
    </head>
    <body>
        <h2>全リーグの情報は次の通りです。</h2>
        <table border="1">
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
        <h2>リーグ別チーム一覧</h2>
        <%  for(int i=0; i<ldto.size(); i++){
                LeagueBean lb = ldto.get(i);
        %>
                <table border="1">
                    <tr>
                        <td colspan="3"><%= lb.getName() %></td>
                    </tr>
                <%  TeamDTO tdto = tdtoArraydto.get(i);
                    for(int j=0; j<tdto.size(); j++){
                            TeamBean tb = tdto.get(j);
                %>
                    <tr>
                            <td><%= tb.getId() %></td>
                            <td><%= tb.getName() %></td>
                            <td>〇</td>
                    </tr>
                <%  } %>
                </table><br>
        <% } %>
    </body>
</html>