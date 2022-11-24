<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.jsp.model.vo.Member"%>
<%
	List<Member> list=(List<Member>)request.getAttribute("members");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>'<%=request.getParameter("keyword") %>'검색에 대한 회원</h2>
	<div id="content">
		
			<%if(list.isEmpty()) {%>
				<!-- 비어있을 때 -->
				
					<h3>조회된 회원이 없습니다 :(</h3>
				
			<%}else{
				for(Member m : list) {%>
				<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>취미</th>
				<th>가입일</th>
			</tr>
			<tr>
				<td><%=m.getMemberId() %></td>
				<td><%=m.getMemberName() %></td>
				<td><%=m.getGender()=='M'?"남":"여" %></td>
				<td><%=m.getAge() %></td>
				<td><%=m.getEmail() %></td>
				<td><%=m.getPhone() %></td>
				<td><%=m.getAddress() %></td>
				<td>
					<ul>
						<%if(m.getHobby().length>0){
							for(String h : m.getHobby()){ %>
								<li><%=h %></li>
							<%}
							}%>
					</ul>
				</td>
				<td><%=m.getEnrollDate() %></td>
				
			</tr>
			<%}
			}%>
		</table>
	</div>


	

</body>
</html>