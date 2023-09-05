<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="cdto" scope="request" class="bean.CortDTO" />
<html>
    <head>
        <title>コート一覧</title>
    </head>
    <body>
        <h2>全コートの情報は次の通りです。</h2>
        <table border="0">
            <tr>
                <th>ID</th>
                <th>コート名</th>
            </tr>
            <%
                for(int i=0; i<cdto.size(); i++){
                    CortBean cb = cdto.get(i);
            %>
                <tr>
                    <td align="center"><%= cb.getId() %></td>
                    <td align="center"><%= cb.getName() %></td>
                </tr>
            <% } %>
        </table>
    </body>
</html>