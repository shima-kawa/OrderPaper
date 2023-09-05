<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="mrdto" scope="request" class="bean.MatchAndResultDTO" />
<jsp:useBean id="mrArrayDto" scope="request" class="bean.MatchAndResultArrayDTO" />
<html>
    <head>
        <link rel="stylesheet" href="css/sty.css">
        <title>試合結果一覧</title>
    </head>
    <body>
        <h2>全試合の結果は次の通りです。（終了済み試合一覧）</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>コート</th>
                <th>a</th>
                <th>b</th>
                <th>勝者</th>
                <th>カウントa</th>
                <th>カウントb</th>
            </tr>
            <%
                for(int i=0; i<mrdto.size(); i++){
                    MatchAndResultBean mrb = mrdto.get(i);
                    if(mrb.getWinner() == 0) continue;
            %>
                <tr>
                    <td align="center"><%= mrb.getId() %></td>
                    <td align="center"><%= mrb.getCort() %></td>
                    <td align="center"><%= mrb.getA() %></td>
                    <td align="center"><%= mrb.getB() %></td>
                    <td align="center"><%= mrb.getWinner() %></td>
                    <td align="center"><%= mrb.getGamecountA() %></td>
                    <td align="center"><%= mrb.getGamecountB() %></td>
                </tr>
            <% } %>
        </table>

        <hr>
        <h2>コート別の全試合の情報は次の通りです。</h2>
        <table border="1">
            <tr>
                <% for(int corti = 0; corti<mrArrayDto.size(); corti++){ %>
                    <th><%= corti+1 %>コート</th>
                <% } %>
            </tr>
            <% for(int tate=0; tate<10; tate++){ %> <%---- TODO: for文の回数上限の指定 -----%>
                <tr align="center">
                    <% for(int corti = 0; corti<mrArrayDto.size(); corti++){ %>
                        <% if(tate >= mrArrayDto.get(corti).size()){ %>
                            <td></td>
                        <% continue; }%>
                        <% if(mrArrayDto.get(corti).get(tate).getWinner() == 0){ %>
                            <td align="center"><a href="registeResult?matchId=<%= mrArrayDto.get(corti).get(tate).getId() %>"><%= mrArrayDto.get(corti).get(tate).getA() %>-<%= mrArrayDto.get(corti).get(tate).getB() %></a></td>
                        <% }else{ %>
                            <td align="center" class="finished"><%= mrArrayDto.get(corti).get(tate).getA() %>-<%= mrArrayDto.get(corti).get(tate).getB() %></td>
                        <% } %>
                    <% } %>
                </tr>
            <% } %>
        </table>
        <% for(int corti=0; corti<mrArrayDto.size(); corti++){
            MatchAndResultDTO mrByCortDto  = mrArrayDto.get(corti);
        %>
            <h3>第<%= corti+1 %>コート</h3>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>コート</th>
                    <th>a</th>
                    <th>b</th>
                    <th>勝者</th>
                    <th>カウントa</th>
                    <th>カウントb</th>
                </tr>
                <%
                    for(int i=0; i<mrByCortDto.size(); i++){
                        MatchAndResultBean mrb = mrByCortDto.get(i);
                        if(mrb.getWinner() == 0) continue;
                %>
                    <tr>
                        <td align="center"><%= mrb.getId() %></td>
                        <td align="center"><%= mrb.getCort() %></td>
                        <td align="center"><%= mrb.getA() %></td>
                        <td align="center"><%= mrb.getB() %></td>
                        <td align="center"><%= mrb.getWinner() %></td>
                        <td align="center"><%= mrb.getGamecountA() %></td>
                        <td align="center"><%= mrb.getGamecountB() %></td>
                    </tr>
                <% } %>
            </table>
        <% } %>
    </body>
</html>