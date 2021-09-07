<%--
  Created by IntelliJ IDEA.
  User: Bazilio
  Date: 2021-09-02
  Time: 7:49 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista de transações</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body class="container">

    <form action="<c:url value="transacoes"/>" method="POST">
        <div class="form-group">
            <label for="ticker">Ticker</label>
            <input name="ticker" id="ticker" type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="data">Data</label>
            <input name="data" id="data" type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="preco">Preço</label>
            <input name="preco" id="preco" type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="quantidade">Quantidade</label>
            <input name="quantidade" id="quantidade" type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="tipo">Tipo</label>
            <input id="tipo" name="tipo" type="text" class="form-control">
        </div>

        <input type="submit" value="Gravar" class="mt-2 btn-primary">
    </form>

    <h1 class="text-center">Lista de Transações</h1>
    <table class="table table-hover table-striped table-bordered">
        <thead>
            <tr>
                <th>TICKER</th>
                <th>DATA</th>
                <th>PREÇO</th>
                <th>QUANTIDADE</th>
                <th>TIPO</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${transacoes}" var="t">
                <tr>
                    <td>${t.ticker}</td>
                    <td>${t.data}</td>
                    <td>${t.preco}</td>
                    <td>${t.quantidade}</td>
                    <td>${t.tipo}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
