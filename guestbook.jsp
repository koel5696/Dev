<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>방명록 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <style>
        .center-text {
            text-align: center;
        }
        .container {
            width: 500px;
            margin: 0 auto;
            border: 2px solid #ccc;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="center-text">방명록 목록</h1>

    <table class="table">
        <thead>
        <tr>
            <th class="center-text">번호</th>
            <th class="center-text">작성일</th>
            <th class="center-text">제목</th>
            <th class="center-text">작성자</th>
            <th class="center-text">이메일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${guestbookList}" var="guestbook" varStatus="status">
            <tr>
                <td class="center-text">${status.count}</td>
                <td class="center-text">${guestbook.date}</td>
                <td class="center-text">
                    <a href="${pageContext.request.contextPath}/ch11/edit.jsp?title=${guestbook.title}" class="guestbook-link">
                        ${guestbook.title}
                    </a>
                </td>
                <td class="center-text">${guestbook.author}</td>
                <td class="center-text">${guestbook.email}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="center-text">
        <a href="${pageContext.request.contextPath}/ch11/newguest.jsp" class="btn btn-primary" id="register-button">등록</a>
    </div>
</div>

<script>
document.querySelector("#register-button").addEventListener("click", function(e) {
    e.preventDefault();
    var url = this.getAttribute("href");

    // URL 확인
    console.log("url:", url);

    location.href = url;
});
</script>

</body>
</html>
