<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" 
           uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css" />
<style>
	button.small{
		width: 30%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function add(){
		$("#add_form").submit();
	}
	
	function dualCheck(){
		//버튼을 눌렀을 때 똑같은 이름의 방명록이 존재하면 
		//"이미 방명록을 남기셨어요!" 존재하지 않으면 
		//"첫 방명록 이시군요!"라고 알림창을 띄우시오.
		var name = $('#name').val();
		
		var xhr = new XMLHttpRequest();
		var url = "${pageContext.request.contextPath}/book/dualCheck"
		xhr.open("GET", url+"?name="+name, true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var check = xhr.responseText;
				if(check == 'y'){
					alert("이미 방명록을 남기셨어요!")
				}else if(check == 'n'){
					alert("첫 방명록 이시군요!");
				}else{
					alert("잠시 후 다시 이용해 주세요!");
				}
			}
		}
		xhr.send();
	}
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title">Add Comment</h1>
		</div>
		<hr />
		<div class="content">
			<form:form id="add_form"
				  action="${pageContext.request.contextPath}/book/add"
				  modelAttribute="bookVo">
				<table class="add_table">
					<tr>
						<th>Name</th>
						<td>
							<form:input id="name" path="writer" />
							<button type="button" 
							        onclick="dualCheck()">중복확인</button>
							<br />
							<form:errors path="writer" class="error"/>	
													        
						</td>
					</tr>
					<tr>
						<th>Password</th>
						<td>
							<form:password id="password" path="password" />
							<form:errors path="password" class="error"/>
						</td>
					</tr>
					<tr>
						<th colspan="2">Comment</th>
					</tr>
					<tr>
						
						<td colspan="2">
							<form:errors path="msg" class="error"/>
							<form:textarea path="msg"></form:textarea>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
		<hr />
		<div class="footer text_center">
			<button class="small" type="button" 
			                      onclick="add();">등록</button>
			<button class="small" type="button"
			        onclick="history.back();">취소</button>
		</div>
	</div>
</body>
</html>


