<%-- 
    Document   : footer
    Created on : Apr 22, 2024, 12:13:47 PM
    Author     : phamdominhvuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Về chúng tôi</h3>
            <p>Apple Simple Store là một trang web bán lẻ trực tuyến cung cấp các sản phẩm của Apple.</p>
        </div>
        <div class="footer-column">
            <h3>Mua sắm</h3>
            <ul>
                <li><a href="/">Trang chủ</a></li>
                <c:forEach items="${categories}" var="c">
                    <li>
                        <c:url value="/" var="myUrl">
                          <c:param name="cateId" value="${c.id}" />
                        </c:url>
                        <a href="${myUrl}">${c.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Liên hệ</h3>
            <p>Email: 2151013110vuong@ou.edu.vn</p>
            <p>Điện thoại: 012 3456 789</p>
        </div>
        <div class="footer-column">
            <h3>Theo dõi chúng tôi</h3>
            <div class="social-icons">
                <a href="https://facebook.com" target="_blank"><i class="fa-brands fa-facebook"></i></a>
                <a href="https://x.com" target="_blank"><i class="fa-brands fa-x-twitter"></i></a>
                <a href="https://instagram.com" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                <a href="https://linkedin.com" target="_blank"><i class="fa-brands fa-linkedin"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2024 Apple Simple Store. Bảo lưu mọi quyền.</p>
    </div>
</footer>

<style>
    .footer {
      background-color: rgb(245, 245, 247);
      color: #333;
      padding: 40px 0;
      /*font-family: 'Roboto', sans-serif;*/
      display: flex;
      justify-content: center;
      flex-direction: row; /* Thay đổi bố cục thành hàng ngang */
      flex-wrap: wrap; /* Cho phép các cột tự động xuống dòng */
    }

    .footer-container {
      display: flex;
      align-items: flex-start;
      gap: 40px;
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 20px;
    }

    .footer-column {
      flex: 1 0 25%;
      min-width: 250px;
    }

    .footer-column h3 {
      color: #000;
      font-size: 1.25rem;
      margin-bottom: 20px;
    }

    .footer-column p {
      line-height: 1.6;
      margin-bottom: 15px;
    }

    .footer-column ul {
      list-style: none;
      padding: 0;
    }

    .footer-column ul li {
      margin-bottom: 10px;
    }

    .footer-column ul li a {
      color: #333;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .footer-column ul li a:hover {
      color: #000;
    }

    .social-icons {
      display: flex;
      align-items: center;
      margin-top: 20px;
    }

    .social-icons a {
      margin: 0 10px;
      display: inline-block;
      transition: transform 0.3s ease;
    }

    .social-icons a:hover {
      transform: scale(1.1);
    }

    .social-icons i {
      font-size: 1.5rem;
      color: #333;
      transition: color 0.3s ease;
    }

    .social-icons i:hover {
      color: #000;
    }

    .footer-bottom {
      text-align: center;
      padding-top: 20px;
      border-top: 1px solid #ccc;
    }

    .footer-bottom p {
      color: #666;
      font-size: 0.9rem;
    }

    @media (max-width: 768px) {
      .footer-container {
        flex-direction: column;
      }

      .footer-column {
        flex: 1 0 100%;
        margin-bottom: 20px;
      }
    }
</style>