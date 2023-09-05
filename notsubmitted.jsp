<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="mdto" scope="request" class="bean.MatchDTO" />
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<jsp:useBean id="rdto" scope="request" class="bean.RegistrationDTO" />

<html>
<head>
    <title>エラー</title>
</head>
<body>
    <h2>この試合のオーダーが送信されていません</h2>
    matchID:<%= mdto.get(0).getId() %><br>
    <%= mdto.get(0).getCort() %>コート<br>
    <%= mdto.get(0).getA() %>：<%= tdto.get(0).getName() %> 対 <%= mdto.get(0).getB() %>：<%= tdto.get(1).getName() %><br>
    <% if(rdto.size() == 0){ %>
        両チームのオーダーが送信されていません。<br>
    <% }else if(rdto.size() == 1){ %>
        <% if(rdto.get(0).getTeamId() == mdto.get(0).getA()) {%>
            <%= tdto.get(1).getName() %>チームのオーダーが送信されていません<br>
        <% }else{%>
            <%= tdto.get(0).getName() %>チームのオーダーが送信されていません<br>
        <% }%>
        
    <% } %>
    <br>
    <a href="index.html">indexへ</a>
</body>
</html>