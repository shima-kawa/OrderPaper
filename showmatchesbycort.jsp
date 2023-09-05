<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="madto" scope="request" class="bean.MatchArrayDTO" />
<html>
    <head>
        <title>コート別試合一覧</title>
    </head>
    <body>
        <h2>コート別の全試合の情報は次の通りです。</h2>
        <table border="1">
            <tr>
                <% for(int corti = 0; corti<madto.size(); corti++){ %>
                    <th><%= corti+1 %>コート</th>
                <% } %>
            </tr>
            <% for(int tate=0; tate<10; tate++){ %> <%---- TODO: for文の回数上限の指定 -----%>
                <tr align="center">
                    <% for(int corti = 0; corti<madto.size(); corti++){ %>
                        <% if(tate >= madto.get(corti).size()){ %>
                            <td></td>
                        <% continue; }%>
                        <td align="center"><%= madto.get(corti).get(tate).getA() %>-<%= madto.get(corti).get(tate).getB() %></td>
                    <% } %>
                </tr>
            <% } %>
        </table>
        <% for(int tablei=0; tablei<madto.size(); tablei++){
            MatchDTO mdto = madto.get(tablei);
        %>
            <h3>第<%= tablei+1 %>コート</h3>
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