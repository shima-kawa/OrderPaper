<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="mcdto" scope="request" class="bean.MatchAndCortDTO" />
<html>
    <head>
        <title>表示画面</title>
    </head>
    <body>
        <h2>コート別の全試合の情報は次の通りです。</h2>
        <% for(int tablei=0; tablei<mcdto.size(); tablei++){
            MatchDTO mdto = mcdto.get(tablei);
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