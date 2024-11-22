<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
    <h1>${post.title}</h1>
    <p>${post.quest}</p>
    <p>작성자: ${post.qid}, 작성일: ${post.ondate}</p>
    <hr>
    
    <h2>댓글</h2>
    <c:forEach var="comment" items="${comments}">
        <p>${comment.content}</p>
        <small>작성자: ${comment.rid}, 작성일: ${comment.ondate}</small>
        <hr>
    </c:forEach>
    
    <h2>댓글 작성</h2>
    <form action="./QABoard.do" method="post">
        <input type="hidden" name="postId" value="${post.id}">
        <label for="commentContent">내용:</label><br>
        <textarea id="commentContent" name="content" rows="3" required></textarea><br><br>
        <button type="submit">댓글 등록</button>
    </form>
</body>
</html>