<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
    <title>방명록 입력</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <style>
        .container {
            width: 600px;
            margin: 50px auto;
            border: 4px solid #000;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: #fff;
            color: #008000;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .center-text {
            text-align: center;
        }

        .content-area {
            margin-top: 20px;
            background-color: #f1f1f1;
            border: 1px solid #000;
            padding: 10px;
            resize: vertical;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="center-text">방명록 입력</h1>
    <form action="${pageContext.request.contextPath}/guestbook/newguest" method="post"> <!-- 변경된 부분: form 추가 -->
        <table>
            <tr>
                <th>작성자</th>
                <td>
                    <input type="text" class="form-control" id="author" name="author" required>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" class="form-control" id="email" name="email" required>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" class="form-control" id="password" name="password" required>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" class="form-control" id="title" name="title" required>
                </td>
            </tr>
        </table>
        <div class="content-area">
            <textarea class="form-control" id="content" name="content" required></textarea>
        </div>
        <div class="center-text">
            <button type="submit" class="btn btn-primary">입력</button> <!-- 변경된 부분: submit 버튼 -->
            <button type="reset" class="btn btn-secondary">취소</button> <!-- 변경된 부분: reset 버튼 -->
            <a href="${pageContext.request.contextPath}/guestbook" class="btn btn-info">목록</a>
        </div>
    </form> <!-- 변경된 부분: form 종료 -->
</div>
</body>
</html>
