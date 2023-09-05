<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="madto" scope="request" class="bean.MatchArrayDTO" />
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<html>
    <head>
        <title>チーム別試合一覧</title>
    </head>
    <body>
        <h2>チーム別の全試合の情報は次の通りです。</h2>
        <%---
        <table border="1">
            <tr>
                <% for(int teami = 0; teami<madto.size(); teami++){ %>
                    <th><%= tdto.get(teami).getName() %>チーム</th>
                <% } %>
            </tr>
            <% for(int tate=0; tate<10; tate++){ %> 
                <tr align="center">
                    <% for(int teami = 0; teami<madto.size(); teami++){ %>
                        <% if(tate >= madto.get(teami).size()){ %>
                            <td></td>
                        <% continue; }%>
                        <td align="center"><%= madto.get(teami).get(tate).getA() %>-<%= madto.get(teami).get(tate).getB() %></td>
                    <% } %>
                </tr>
            <% } %>
        </table>
        ---%>
        <% for(int tablei=0; tablei<madto.size(); tablei++){
            TeamBean tb = tdto.get(tablei);
            MatchDTO mdto = madto.get(tablei);
        %>
            <h3>id:<%= tb.getId() %>,<%= tb.getName() %>チーム</h3>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>コート</th>
                    <th>a</th>
                    <th>b</th>
                </tr>
                <%
                    for(int i=0; i<mdto.size(); i++){
                        MatchBean mb = mdto.get(i);
                %>
                    <tr>
                        <td align="center"><%= mb.getId() %></td>
                        <td align="center"><%= mb.getCort() %></td>
                        <td align="center"><%= mb.getA() %></td>
                        <td align="center"><%= mb.getB() %></td>
                    </tr>
                <% } %>
            </table>
        <% } %>
    </body>
</html>