<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="ldto" scope="request" class="bean.LeagueDTO" />
<jsp:useBean id="tdtoArraydto" scope="request" class="bean.TeamArrayDTO" />
<jsp:useBean id="maradto" scope="request" class="bean.MatchAndResultArrayDTO" />
<html>
    <head>
        <title>リーグ一覧</title>
        <link rel="stylesheet" type="text/css" href="css/league.css">
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
                    for(int j=0; j<lb.getTeamNum(); j++){
                        if(j<tdto.size()){
                            TeamBean tb = tdto.get(j);
                            out.println("<tr>");
                            out.println("<td>" + tb.getId() + "</td>");
                            out.println("<td>" + tb.getName() + "</td>");
                            for(int k=0; k<lb.getTeamNum(); k++){
                                if(j==k){
                                    out.println("<td style=\"background-image: linear-gradient(to right top, transparent calc(50% - 0.5px), #999 50%, #999 calc(50% + 0.5px), transparent calc(50% + 1px))\"></td>");
                                }
                                else{
                                    out.println("<td></td>");
                                }
                            }
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("</tr>");
                        }
                        else{
                            out.println("<tr>");
                            out.println("<td></td>");
                            out.println("<td></td>");
                            for(int k=0; k<lb.getTeamNum(); k++){
                                if(j==k){
                                    out.println("<td style=\"background-image: linear-gradient(to right top, transparent calc(50% - 0.5px), #999 50%, #999 calc(50% + 0.5px), transparent calc(50% + 1px))\"></td>");
                                }
                                else{
                                    out.println("<td>　</td>");
                                }
                            }
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("</tr>");
                        }
                    }
                %>
                </table><br>
        <% } %>
                <h2>リーグ別チーム一覧試合結果入り</h2>
        <%  
            int[][] indexOfMatchIdInLeague = new int[1][1]; // ダミー
            for(int i=0; i<ldto.size(); i++){
                LeagueBean lb = ldto.get(i);
                MatchAndResultDTO mardto = maradto.get(i);
                // リーグ内のマッチIDの指定
                indexOfMatchIdInLeague = new int[lb.getTeamNum()][lb.getTeamNum()];
                // 一段目
                for(int j=1; j<lb.getTeamNum(); j++){
                    indexOfMatchIdInLeague[j][0] = indexOfMatchIdInLeague[0][j] = j-1;
                }
                /* 二段目以降 */
                for(int j=1; j<lb.getTeamNum(); j++){
                    for(int k=j; k<lb.getTeamNum(); k++){
                        indexOfMatchIdInLeague[k][j] = indexOfMatchIdInLeague[j][k] = indexOfMatchIdInLeague[j-1][k] + (lb.getTeamNum() - j - 1);
                    }
                }
        %>
                <div class="league-result">
                <table>
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
                                out.println("<td class=\"team-id\">" + tb.getId() + "</td>");
                            }
                            else{
                                out.println("<td class=\"team-id\"></td>");
                            }
                        } %>
                        <td>勝点</td>
                        <td>得失</td>
                        <td>順位</td>                        
                    </tr>
                <%  
                    for(int j=0; j<lb.getTeamNum(); j++){
                        if(j<tdto.size()){
                            TeamBean tb = tdto.get(j);
                            out.println("<tr>");
                            out.println("<td class=\"team-id\">" + tb.getId() + "</td>");
                            out.println("<td class=\"team-name\">" + tb.getName() + "</td>");
                            for(int k=0; k<lb.getTeamNum(); k++){
                                if(j==k){
                                    out.println("<td style=\"background-image: linear-gradient(to right top, transparent calc(50% - 0.5px), #999 50%, #999 calc(50% + 0.5px), transparent calc(50% + 1px))\"></td>");
                                }
                                else{
                                    MatchAndResultBean marb = mardto.get(indexOfMatchIdInLeague[j][k]);
                                    if(marb.getWinner() == 0){
                                        out.println("<td></td>");
                                    }
                                    else{
                                        if(j<k && marb.getWinner()==tb.getId()){ //winner
                                            out.println("<td><div class=\"win\">" + marb.getGamecountA() + "</div></td>");
                                        }
                                        else if(j>k && marb.getWinner()==tb.getId()){ //winner
                                            out.println("<td><div class=\"win\">" + marb.getGamecountB() + "</div></td>");
                                        }
                                        else{ //loser
                                            out.println("<td>" + marb.getGamecountB() + "</td>");
                                        }
                                    }
                                }
                            }
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("</tr>");
                        }
                        else{
                            out.println("<tr>");
                            out.println("<td class=\"team-id\"></td>");
                            out.println("<td class=\"team-name\"></td>");
                            for(int k=0; k<lb.getTeamNum(); k++){
                                if(j==k){
                                    out.println("<td style=\"background-image: linear-gradient(to right top, transparent calc(50% - 0.5px), #999 50%, #999 calc(50% + 0.5px), transparent calc(50% + 1px))\"></td>");
                                }
                                else{
                                    out.println("<td>　</td>");
                                }
                            }
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("<td></td>");
                            out.println("</tr>");
                        }
                    }
                %>
                </table>
                </div><br>
        <% } %>
    </body>
</html>