<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>방명록 수정</title>
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
    </style>
</head>
<body>
<div class="container">
    <h1 class="center-text">방명록 수정</h1>
    <table>
        <tr>
            <th>작성자</th>
            <td>
                <input type="text" class="form-control" id="author" name="author" value="" required>
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>
                <input type="email" class="form-control" id="email" name="email" value="" required>
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
                <input type="text" class="form-control" id="title" name="title" value="" required>
            </td>
        </tr>
    </table>
    <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
    </div>
    <div class="center-text">
        <button type="submit" class="btn btn-primary" onclick="validateForm()">수정</button>
        <button type="button" class="btn btn-danger" onclick="deleteEntry()">삭제</button>
        <a href="${pageContext.request.contextPath}/guestbook" class="btn btn-info">목록</a>
    </div>
</div>

<script>
    function validateForm() {
        var author = document.getElementById("author").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;

        if (author === "" || email === "" || title === "" || content === "") {
            alert("모든 입력란을 채워주세요.");
            return false;
        }
        return true;
    }

    function deleteEntry() {
        document.getElementById("author").value = "";
        document.getElementById("email").value = "";
        document.getElementById("password").value = "";
        document.getElementById("title").value = "";
        document.getElementById("content").value = "";
    }
</script>
</body>
</html>

