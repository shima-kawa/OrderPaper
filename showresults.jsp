<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="rdto" scope="request" class="bean.ResultDTO" />
<html>
    <head>
        <title>表示画面</title>
    </head>
    <body>
        <h2>全試合の情報は次の通りです。</h2>
        <table border="0">
            <tr>
                <th>ID</th>
                <th>winner</th>
                <th>a</th>
                <th>b</th>
            </tr>
            <%
                for(int i=0; i<rdto.size(); i++){
                    ResultBean mb = rdto.get(i);
            %>
                <tr>
                    <td align="center"><%= mb.getId() %></td>
                    <td align="center"><%= mb.getWinner() %></td>
                    <td align="center"><%= mb.getGamecountA() %></td>
                    <td align="center"><%= mb.getGamecountB() %></td>
                </tr>
            <% } %>
        </table>
    </body>
</html>