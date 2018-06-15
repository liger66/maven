<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<style>
	button.small{
		width: 30%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function check(){
		if($("#name").val() == ""){
			alert("이름을 입력해 주세요.");
			$("#name").focus();
			return;
		}
		
		$("#update_form").submit();
		
	}
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title">Modify Comment</h1>
		</div>
		<hr />
		<div class="content">
			<form id="update_form"
				  action="/book/update"
				  method="post">
				<%-- <input type="hidden" name="id" value="${bvo.id }" /> --%>
				<table class="add_table">
					<tr>
						<th>Name</th>
						<td>
							<input id="name" type="text" name="writer" 
							       value="${bvo.writer }"/>
						</td>
					</tr>
					<tr>
						<th>Password</th>
						<td>
							<input id="password" type="password" name="password" />
						</td>
					</tr>
					<tr>
						<th colspan="2">Comment</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="msg">${bvo.msg }</textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<hr />
		<div class="footer text_center">
			<button class="small" type="button"
			        onclick="check();">수정</button>
			<button class="small" type="button"
			        onclick="history.back();">취소</button>
		</div>
	</div>
</body>
</html>