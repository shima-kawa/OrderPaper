<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="rdto" scope="request" class="bean.RegistrationDTO" />
<jsp:useBean id="tdtoForForward" scope="request" class="bean.TeamDTO" />
<html>
    <head>
        <title>送信済みオーダー一覧</title>
    </head>
    <body>
        <h2>送信されたオーダーは次の通りです。</h2>
        <table border="1">
            <tr>
                <th>match</th>
                <th colspan="2">team</th>
                <th colspan="2">選手1</th>
                <th colspan="2">選手2</th>
                <th colspan="2">選手3</th>
                <th colspan="2">選手4</th>
                <th colspan="2">選手5</th>
                <th colspan="2">選手6</th>
            </tr>
            <%
                for(int i=0; i<rdto.size(); i++){
                    RegistrationBean rb = rdto.get(i);
                    TeamBean tb = tdtoForForward.get(i);
                    int[] memberId = rb.getMemberId();
                    String[] memberName = tb.getPlayers();
            %>
                <tr>
                    <td align="center"><%= rb.getMatchId() %></td>
                    <td align="center"><%= rb.getTeamId() %></td>
                    <td align="center"><%= tb.getName() %></td>
                    <% for(int memi=0; memi < memberId.length; memi++){ %>
                        <td align="center"><%= memberId[memi] %></td>
                        <td align="center"><%= memberName[memberId[memi]] %></td>
                    <% } %>
                </tr>
            <% } %>
        </table>
    </body>
</html>