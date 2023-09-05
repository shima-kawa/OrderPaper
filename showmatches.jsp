<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="mdto" scope="request" class="bean.MatchDTO" />
<html>
    <head>
        <title>試合一覧</title>
    </head>
    <body>
        <h2>全試合の情報は次の通りです。</h2>
        <table border="0">
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
    </body>
</html>