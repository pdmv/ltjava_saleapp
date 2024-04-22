<%-- 
    Document   : header
    Created on : Apr 22, 2024, 12:11:13 PM
    Author     : phamdominhvuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/?page=1" />">Sale App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/?page=1" />">Trang chủ</a>
                </li>
                <c:forEach items="${categories}" var="c">
                    <li class="nav-item">
                    <c:url value="/" var="myUrl">
                        <c:param name="cateId" value="${c.id}" />
                    </c:url>
                    <a class="nav-link" href="${myUrl}">${c.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <form class="d-flex">
            <input class="form-control me-2" type="text" placeholder="Nhập từ khoá..." name="kw">
            <button class="btn btn-primary" type="submit">Tìm</button>
        </form>
    </div>
</nav>
