<%@page contentType="text/html;charset=utf8" %>
<%@page import="bean.*" %>
<jsp:useBean id="mdto" scope="request" class="bean.MatchDTO" />
<jsp:useBean id="tdto" scope="request" class="bean.TeamDTO" />
<jsp:useBean id="rdto" scope="request" class="bean.RegistrationDTO" />
<%
    MatchBean mb = mdto.get(0);
    TeamBean tbA = tdto.get(0);
    TeamBean tbB = tdto.get(1);
    RegistrationBean rbA = rdto.get(0);
    RegistrationBean rbB = rdto.get(1);
    String[] playersA = tbA.getPlayers();
    String[] playersB = tbB.getPlayers();
    int[] memberIdA = rbA.getMemberId();
    int[] memberIdB = rbB.getMemberId();
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title><%= tbA.getName() %> VS <%= tbB.getName() %> | ジャッジペーパー</title>
</head>
<body>
    <section class="sheet">
        <!-- 印刷内容 1枚目 -->
        <h2 class="judge-paper-title">ダブルス・シングルス採点票</h2>
        <table class="judge-paper-header">
            <tr class="judge-paper-tr-1">
                <td class="judge-paper-tr-1-type">種別<div class="judge-paper-tr-1-type-male">男</div><div class="judge-paper-tr-1-type-female">女</div></td>
                <td><div class="judge-paper-tr-1-cort"><div class="judge-paper-tr-1-cort-left">第</div><%= mb.getCort() %><div class="judge-paper-tr-1-cort-right">コート</div></td>
                <td><div class="judge-paper-tr-1-position">正審</div>正審の名前</td>
                <td><div class="judge-paper-tr-1-position">副審</div>副審の名前</td>
            </tr>
            <tr class="judge-paper-tr-2">
                <td><div class="judge-paper-tr-2-match"><div class="judge-paper-tr-2-match-left">第</div>N<div class="judge-paper-tr-2-match-right">回戦</div></td>
                <td>開始　　　　　：　　　　　<br>終了　　　　　：　　　　　</td>
                <td><div class="judge-paper-tr-1-position">線審</div>線審①の名前</td>
                <td><div class="judge-paper-tr-1-position">線審</div>線審②の名前</td>
            </tr>
        </table>
        <table class="judge-paper-main">
            <tr class="judge-paper-tr-3">
                <td >No</td>
                <td colspan="4"><%= tbA.getId() %></td>
                <td colspan="3">所属</td>
                <td colspan="8"><%= tbA.getName() %></td>
                <td colspan="2" id="judge-paper-score-title">（スコアー）</td>
                <td>No</td>
                <td colspan="4"><%= tbB.getId() %></td>
                <td colspan="3">所属</td>
                <td colspan="8"><%= tbB.getName() %></td>
            </tr>
            <tr class="judge-paper-tr-4">
                <td colspan="3" rowspan="2" class="judge-paper-player">プレーヤー</td>
                <td>A</td>
                <td colspan="12"><%= playersA[memberIdA[0]] %></td>
                <td colspan="2" rowspan="3" id="judge-paper-score">ー</td>
                <td colspan="3" rowspan="2" class="judge-paper-player">プレーヤー</td>
                <td>A</td>
                <td colspan="12"><%= playersB[memberIdB[0]] %></td>
            </tr>
            <tr class="judge-paper-tr-5">
                <td rowspan="2">B</td>
                <td colspan="12" rowspan="2"><%= playersA[memberIdA[1]] %></td>
                <td rowspan="2">B</td>
                <td colspan="12" rowspan="2"><%= playersB[memberIdB[1]] %></td>
            </tr>
            <tr>
                <td colspan="3" class="judge-paper-tr-6">サイド</td>
                <td colspan="3" class="judge-paper-tr-6">サイド</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">×</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-1">-①-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-2">-②-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-3">-③-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-4">-④-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-5">-⑤-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-6">-⑥-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-7">-⑦-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-8">-⑧-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-9">
                <td rowspan="3" class="judge-paper-S">S</td>
                <td rowspan="3" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="3" id="judge-paper-gamecount-f">-Ⓕ-</td>
                <td rowspan="3" class="judge-paper-S">S</td>
                <td rowspan="3" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-10">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-11">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-12">
                <td colspan="2">(警告)</td>
                <td colspan="3">Y</td>
                <td colspan="3">Y</td>
                <td colspan="3">R</td>
                <td colspan="6" class="judge-paper-time">タイム</td>
                <td colspan="6" class="judge-paper-time">タイム</td>
                <td colspan="2">(警告)</td>
                <td colspan="3">Y</td>
                <td colspan="3">Y</td>
                <td colspan="3">R</td>
            </tr>
            <tr class="judge-paper-tr-13">
                <td colspan="2" class="judge-paper-applicable">該当事項</td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="6">A　　５　・　５<br>B　　５　・　５</td>
                <td colspan="6">A　　５　・　５<br>B　　５　・　５</td>
                <td colspan="2" class="judge-paper-applicable">該当事項</td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="3"></td>
            </tr>
        </table>
        <table class="judge-paper-footer">
            <tr class="judge-paper-tr-14">
                <td>勝者サイン</td>
                <td></td>
                <td>勝者No.</td>
                <td></td>
                <td>進行</td>
                <td></td>
                <td>点検</td>
                <td></td>
                <td>記録</td>
                <td></td>
            </tr>
        </table>
        <p class="judge-paper-organization">(財)日本ソフトテニス連盟を参考に丸コピしています</p>
    </section>
    <section class="sheet">
        <!-- 印刷内容 2枚目 -->
        <h2 class="judge-paper-title">ダブルス・シングルス採点票</h2>
        <table class="judge-paper-header">
            <tr class="judge-paper-tr-1">
                <td class="judge-paper-tr-1-type">種別<div class="judge-paper-tr-1-type-male">男</div><div class="judge-paper-tr-1-type-female">女</div></td>
                <td><div class="judge-paper-tr-1-cort"><div class="judge-paper-tr-1-cort-left">第</div><%= mb.getCort() %><div class="judge-paper-tr-1-cort-right">コート</div></td>
                <td><div class="judge-paper-tr-1-position">正審</div>正審の名前</td>
                <td><div class="judge-paper-tr-1-position">副審</div>副審の名前</td>
            </tr>
            <tr class="judge-paper-tr-2">
                <td><div class="judge-paper-tr-2-match"><div class="judge-paper-tr-2-match-left">第</div>N<div class="judge-paper-tr-2-match-right">回戦</div></td>
                <td>開始　　　　　：　　　　　<br>終了　　　　　：　　　　　</td>
                <td><div class="judge-paper-tr-1-position">線審</div>線審①の名前</td>
                <td><div class="judge-paper-tr-1-position">線審</div>線審②の名前</td>
            </tr>
        </table>
        <table class="judge-paper-main">
            <tr class="judge-paper-tr-3">
                <td >No</td>
                <td colspan="4"><%= tbA.getId() %></td>
                <td colspan="3">所属</td>
                <td colspan="8"><%= tbA.getName() %></td>
                <td colspan="2" id="judge-paper-score-title">（スコアー）</td>
                <td>No</td>
                <td colspan="4"><%= tbB.getId() %></td>
                <td colspan="3">所属</td>
                <td colspan="8"><%= tbB.getName() %></td>
            </tr>
            <tr class="judge-paper-tr-4">
                <td colspan="3" rowspan="2" class="judge-paper-player">プレーヤー</td>
                <td>A</td>
                <td colspan="12"><%= playersA[memberIdA[2]] %></td>
                <td colspan="2" rowspan="3" id="judge-paper-score">ー</td>
                <td colspan="3" rowspan="2" class="judge-paper-player">プレーヤー</td>
                <td>A</td>
                <td colspan="12"><%= playersB[memberIdB[2]] %></td>
            </tr>
            <tr class="judge-paper-tr-5">
                <td rowspan="2">B</td>
                <td colspan="12" rowspan="2"><%= playersA[memberIdA[3]] %></td>
                <td rowspan="2">B</td>
                <td colspan="12" rowspan="2"><%= playersB[memberIdB[3]] %></td>
            </tr>
            <tr>
                <td colspan="3" class="judge-paper-tr-6">サイド</td>
                <td colspan="3" class="judge-paper-tr-6">サイド</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">×</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-1">-①-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-2">-②-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-3">-③-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-4">-④-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-5">-⑤-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-6">-⑥-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-7">-⑦-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-8">-⑧-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-9">
                <td rowspan="3" class="judge-paper-S">S</td>
                <td rowspan="3" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="3" id="judge-paper-gamecount-f">-Ⓕ-</td>
                <td rowspan="3" class="judge-paper-S">S</td>
                <td rowspan="3" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-10">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-11">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-12">
                <td colspan="2">(警告)</td>
                <td colspan="3">Y</td>
                <td colspan="3">Y</td>
                <td colspan="3">R</td>
                <td colspan="6" class="judge-paper-time">タイム</td>
                <td colspan="6" class="judge-paper-time">タイム</td>
                <td colspan="2">(警告)</td>
                <td colspan="3">Y</td>
                <td colspan="3">Y</td>
                <td colspan="3">R</td>
            </tr>
            <tr class="judge-paper-tr-13">
                <td colspan="2" class="judge-paper-applicable">該当事項</td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="6">A　　５　・　５<br>B　　５　・　５</td>
                <td colspan="6">A　　５　・　５<br>B　　５　・　５</td>
                <td colspan="2" class="judge-paper-applicable">該当事項</td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="3"></td>
            </tr>
        </table>
        <table class="judge-paper-footer">
            <tr class="judge-paper-tr-14">
                <td>勝者サイン</td>
                <td></td>
                <td>勝者No.</td>
                <td></td>
                <td>進行</td>
                <td></td>
                <td>点検</td>
                <td></td>
                <td>記録</td>
                <td></td>
            </tr>
        </table>
        <p class="judge-paper-organization">(財)日本ソフトテニス連盟を参考に丸コピしています</p>
    </section>
    <section class="sheet">
        <!-- 印刷内容 3枚目 -->
        <h2 class="judge-paper-title">ダブルス・シングルス採点票</h2>
        <table class="judge-paper-header">
            <tr class="judge-paper-tr-1">
                <td class="judge-paper-tr-1-type">種別<div class="judge-paper-tr-1-type-male">男</div><div class="judge-paper-tr-1-type-female">女</div></td>
                <td><div class="judge-paper-tr-1-cort"><div class="judge-paper-tr-1-cort-left">第</div><%= mb.getCort() %><div class="judge-paper-tr-1-cort-right">コート</div></td>
                <td><div class="judge-paper-tr-1-position">正審</div>正審の名前</td>
                <td><div class="judge-paper-tr-1-position">副審</div>副審の名前</td>
            </tr>
            <tr class="judge-paper-tr-2">
                <td><div class="judge-paper-tr-2-match"><div class="judge-paper-tr-2-match-left">第</div>N<div class="judge-paper-tr-2-match-right">回戦</div></td>
                <td>開始　　　　　：　　　　　<br>終了　　　　　：　　　　　</td>
                <td><div class="judge-paper-tr-1-position">線審</div>線審①の名前</td>
                <td><div class="judge-paper-tr-1-position">線審</div>線審②の名前</td>
            </tr>
        </table>
        <table class="judge-paper-main">
            <tr class="judge-paper-tr-3">
                <td >No</td>
                <td colspan="4"><%= tbA.getId() %></td>
                <td colspan="3">所属</td>
                <td colspan="8"><%= tbA.getName() %></td>
                <td colspan="2" id="judge-paper-score-title">（スコアー）</td>
                <td>No</td>
                <td colspan="4"><%= tbB.getId() %></td>
                <td colspan="3">所属</td>
                <td colspan="8"><%= tbB.getName() %></td>
            </tr>
            <tr class="judge-paper-tr-4">
                <td colspan="3" rowspan="2" class="judge-paper-player">プレーヤー</td>
                <td>A</td>
                <td colspan="12"><%= playersA[memberIdA[4]] %></td>
                <td colspan="2" rowspan="3" id="judge-paper-score">ー</td>
                <td colspan="3" rowspan="2" class="judge-paper-player">プレーヤー</td>
                <td>A</td>
                <td colspan="12"><%= playersB[memberIdB[4]] %></td>
            </tr>
            <tr class="judge-paper-tr-5">
                <td rowspan="2">B</td>
                <td colspan="12" rowspan="2"><%= playersA[memberIdA[5]] %></td>
                <td rowspan="2">B</td>
                <td colspan="12" rowspan="2"><%= playersB[memberIdB[5]] %></td>
            </tr>
            <tr>
                <td colspan="3" class="judge-paper-tr-6">サイド</td>
                <td colspan="3" class="judge-paper-tr-6">サイド</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">×</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-1">-①-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-2">-②-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-3">-③-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-4">-④-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-5">-⑤-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-6">-⑥-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-7">-⑦-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-7">
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="2" id="judge-paper-gamecount-8">-⑧-</td>
                <td rowspan="2" class="judge-paper-S">S</td>
                <td rowspan="2" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-8">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-9">
                <td rowspan="3" class="judge-paper-S">S</td>
                <td rowspan="3" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td colspan="2" rowspan="3" id="judge-paper-gamecount-f">-Ⓕ-</td>
                <td rowspan="3" class="judge-paper-S">S</td>
                <td rowspan="3" class="judge-paper-R">R</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-10">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-11">
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
                <td class="judge-paper-point">○</td>
            </tr>
            <tr class="judge-paper-tr-12">
                <td colspan="2">(警告)</td>
                <td colspan="3">Y</td>
                <td colspan="3">Y</td>
                <td colspan="3">R</td>
                <td colspan="6" class="judge-paper-time">タイム</td>
                <td colspan="6" class="judge-paper-time">タイム</td>
                <td colspan="2">(警告)</td>
                <td colspan="3">Y</td>
                <td colspan="3">Y</td>
                <td colspan="3">R</td>
            </tr>
            <tr class="judge-paper-tr-13">
                <td colspan="2" class="judge-paper-applicable">該当事項</td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="6">A　　５　・　５<br>B　　５　・　５</td>
                <td colspan="6">A　　５　・　５<br>B　　５　・　５</td>
                <td colspan="2" class="judge-paper-applicable">該当事項</td>
                <td colspan="3"></td>
                <td colspan="3"></td>
                <td colspan="3"></td>
            </tr>
        </table>
        <table class="judge-paper-footer">
            <tr class="judge-paper-tr-14">
                <td>勝者サイン</td>
                <td></td>
                <td>勝者No.</td>
                <td></td>
                <td>進行</td>
                <td></td>
                <td>点検</td>
                <td></td>
                <td>記録</td>
                <td></td>
            </tr>
        </table>
        <p class="judge-paper-organization">(財)日本ソフトテニス連盟を参考に丸コピしています</p>
    </section>

</body>
</html>