<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Member m=(Member)request.getAttribute("member");
	//String[] hobbys=m.getHobby();
	
	String[] checkData=new String[5];
	for(String h : m.getHobby() ){
		switch(h){
			case "운동" : checkData[0]="checked";break;
			case "등산" : checkData[1]="checked";break;
			case "독서" : checkData[2]="checked";break;
			case "게임" : checkData[3]="checked";break;
			case "여행" : checkData[4]="checked";break;
		}
	}
%>
<%@ include file="/views/common/header.jsp" %>
<%-- <jsp:include page="/views/common/header.jsp"/> --%>

	<section id=enroll-container>
		<h2>회원 정보 수정</h2>
		<form id="memberFrm" method="post" >
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="userId" id="userId_" 
						value="${member.userId }" readonly>
					</td>
				</tr>
					<th>이름</th>
					<td>	
					<input type="text"  name="userName" id="userName" required
					value="${member.userName }"
					><br>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>	
					<input type="number" name="age" id="age"
					value="${member.age }"><br>
					</td>
				</tr> 
				<tr>
					<th>이메일</th>
					<td>	
						<input type="email" placeholder="abc@xyz.com" name="email" id="email"
						value="${member.email }" maxlength="20"><br>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>	
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11"
						value="${member.phone }"><br>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>	
						<input type="text" placeholder="" name="address" id="address" 
						value="${member.address } ${member.gender}"><br>
					</td>
				</tr>
				<tr>
					<th>성별 </th>
					<td>
						<!-- DB정보에 따라 분기처리할것 -->
							<input type="radio" name="gender" id="gender0" value="M"
							<c:if test="${member.gender.equals('M') }">
<%-- 							<%if(m.getGender()=='M'){%> --%>
								checked
<%-- 							<% }%> --%>
							</c:if> 
							>
							<label for="gender0">남</label>
							<input type="radio" name="gender" id="gender1" value="F"
							<c:if test="${member.gender.equals('F') }">
<%-- 							<%if(m.getGender()=='F'){%> --%>
								checked
<%-- 							<% }%> --%>
							</c:if>
							>
							<label for="gender1">여</label>
						
						
					</td>
				</tr>
				<tr>
					<th>취미 </th>
					<td>
						<input type="checkbox" name="hobby" id="hobby0" value="운동" <%=checkData[0] %> ><label for="hobby0">운동</label>
						<input type="checkbox" name="hobby" id="hobby1" value="등산" <%=checkData[1] %>><label for="hobby1">등산</label>
						<input type="checkbox" name="hobby" id="hobby2" value="독서" <%=checkData[2] %>><label for="hobby2">독서</label><br />
						<input type="checkbox" name="hobby" id="hobby3" value="게임" <%=checkData[3] %>><label for="hobby3">게임</label>
						<input type="checkbox" name="hobby" id="hobby4" value="여행" <%=checkData[4] %>><label for="hobby4">여행</label><br />
						

					</td>
				</tr>
			</table>
			<input type="button" value="비밀번호 변경"
			onclick="fn_updatePassword();">
			<input type="button" value="정보수정" onclick="fn_updateMember();"/>
			<input type="button" value="탈퇴" onclick="fn_deleteMember();"/>
		</form>
	</section>
	<script>
		const fn_updatePassword=()=>{
			//새창으로 패스워드 수정페이지 연결
			open("${pageContext.request.contextPath}/member/updatePassword.do?userId=${loginMember!=null?loginMember.userId:""}"
					,"_blank","width=400, height=210,left=500 ,top=200");
		}
		const fn_updateMember=()=>{
			/* form태그 안에 action 속성의 주소를 넣기  */
			$("#memberFrm").attr("action","${pageContext.request.contextPath}/member/updateMember.do");
			/* 액션값 제출하기 */
			$("#memberFrm").submit();
		}
		const fn_deleteMember=()=>{
			/* form태그 안에 action 속성의 주소를 넣기  */
			$("#memberFrm").attr("action","${pageContext.request.contextPath}/member/deleteMember.do");
			/* 액션값 제출하기 */
			$("#memberFrm").submit();
		}
	</script>
	
<jsp:include page="/views/common/footer.jsp"/>
<%-- <%@ include file="/views/common/footer.jsp" %> --%>