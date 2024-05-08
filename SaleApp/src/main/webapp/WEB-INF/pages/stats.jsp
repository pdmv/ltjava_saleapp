<%-- 
    Document   : stats
    Created on : Apr 24, 2024, 1:42:02 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 class="text-center text-info mt-1">THỐNG KÊ DOANH THU</h1>

<div class="row">
    <div class="col-md-5 col-12">
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${statsRevenue}" var="s">
                <tr>
                    <td>${s[0]}</td>
                    <td>${s[1]}</td>
                    <td>${String.format("%,d", s[2])} VNĐ</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-7 col-12">
        <canvas id="chart1"></canvas>
    </div>
</div>

<div class="row">
    <div class="col-md-5 col-12">
        <table class="table">
            <tr>
                <th>Thời gian</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${statsRevenueByPeriod}" var="s">
                <tr>
                    <td>${s[0]}</td>
                    <td>${String.format("%,d", s[1])} VNĐ</td>
                </tr>
            </c:forEach>
        </table>
        <div class="alert alert-success">
            <h4>Năm: ${year}</h4>
            <h4>Khoảng thời gian:
                <c:choose>
                    <c:when test="${period=='MONTH'}"> Tháng</c:when>
                    <c:otherwise> Quý</c:otherwise>
                </c:choose>
            </h4>
        </div>
        <form>
            <div class="form-floating mb-3 mt-3">
                <input type="number" class="form-control" id="year" placeholder="Năm" name="year">
                <label for="year">Năm</label>
            </div>
            <div class="form-floating">
                <select class="form-select" id="period" name="period">
                    <option value="MONTH">Tháng</option>
                    <option value="QUARTER">Quý</option>
                </select>
                <label for="period" class="form-label">Khoảng thời gian:</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <button class="btn btn-success">Lọc</button>
            </div>
        </form>
    </div>
    <div class="col-md-7 col-12">
        <canvas id="chart2"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/script.js"/>"></script>
<script>
    function drawChart(ctx, labels, data) {
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Doanh thu',
                        data: data,
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    let label = [];
    let data = [];

    <c:forEach items="${statsRevenue}" var="s">
    label.push('${s[1]}');
    data.push('${s[2]}');
    </c:forEach>

    let label1 = [];
    let data1 = [];

    <c:forEach items="${statsRevenueByPeriod}" var="s">
    label1.push('${s[0]}');
    data1.push('${s[1]}');
    </c:forEach>

    window.onload = function () {
        let ctx1 = document.getElementById("chart1");
        let ctx2 = document.getElementById("chart2");

        drawChart(ctx1, label, data);
        drawChart(ctx2, label1, data1);
    }
</script>