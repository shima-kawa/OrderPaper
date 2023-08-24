<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO"/>

<html>
<head>
    <title>ログイン画面</title>
</head>
<body>
    <h2>オーダーを送信するチームを選択してください</h2>
    <form action="/orderpaper/registration" method="post">
        <select name="myTeam">
        <% for(int i=0; i<tdto.size(); i++){
            TeamBean tb = tdto.get(i);
        %>
            <option><%= tb.getName() %></option>
        <% } %>
        </select>
        <input type="submit" value="送信">
    </form>
</body>
</html>