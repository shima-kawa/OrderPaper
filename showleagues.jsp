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
                        <td colspan="<%= 5+lb.getTeamNum() %>"><%= lb.getName() %></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>チーム名</td>
                        <% 
                        TeamDTO tdto = tdtoArraydto.get(i);
                        for(int j=0; j<lb.getTeamNum(); j++){
                            if(j < tdto.size()){
                                TeamBean tb = tdto.get(j);
                                out.println("<td>" + tb.getId() + "</td>");
                            }
                            else{
                                out.println("<td></td>");
                            }
                        } %>
                        <td>勝点</td>
                        <td>得失</td>
                        <td>順位</td>                        
                    </tr>
                <%  
                    for(int j=0; j<tdto.size(); j++){
                            TeamBean tb = tdto.get(j);
                %>
                    <tr>
                            <td><%= tb.getId() %></td>
                            <td><%= tb.getName() %></td>
                            <%  for(int k=0; k<lb.getTeamNum(); k++){
                                    if(j==k){ %>
                                        <td style="background-image: linear-gradient(to right top, transparent calc(50% - 0.5px), #999 50%, #999 calc(50% + 0.5px), transparent calc(50% + 1px))"></td>
                                <%  }else{ %>
                                        <td></td>
                                <%  } %>
                            <% } %>
                            <td></td>
                            <td></td>
                            <td></td>
                    </tr>
                <%  } %>
                </table><br>
        <% } %>
    </body>
</html>