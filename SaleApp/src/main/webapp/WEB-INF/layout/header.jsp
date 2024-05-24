<%-- 
    Document   : header
    Created on : Apr 22, 2024, 12:11:13 PM
    Author     : phamdominhvuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/?page=1" />">
            <i class="fa-brands fa-apple fa-lg" style="color: #333; margin: 5px;"></i> 
            Apple Simple Store
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<c:url value="/?page=1" />">Trang chủ</a>
                </li>
                <c:forEach items="${categories}" var="c">
                    <li class="nav-item">
                        <c:url value="/" var="myUrl">
                            <c:param name="cateId" value="${c.id}" />
                        </c:url>
                        <a class="nav-link" href="${myUrl}">${c.name}</a>
                    </li>
                </c:forEach>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/stats" />">Thống kê</a>
                </li>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/login" />">Đăng nhập</a>
                        </li>
                    </c:when>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/" />">Chào ${pageContext.request.userPrincipal.name}!</a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
            <form class="d-flex" action="/" method="get"> 
                <input class="form-control me-2" type="text" placeholder="Nhập từ khoá..." name="kw" style="border-radius: 8px;">
                <button class="btn btn-primary" type="submit" style="height: 38px;">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>
        </div>
    </div>
</nav>

<style>
    .btn-primary {
        background-color: #007bff; /* Set the background color of the button */
        color: white; /* Set the text color of the button */
        border: none; /* Remove the border */
        border-radius: 8px; /* Add rounded corners */
        transition: background-color 0.3s ease; /* Add a transition for the background color */
    }

    .btn-primary:hover {
        background-color: #0056b3; /* Change the background color on hover */
    }
</style>