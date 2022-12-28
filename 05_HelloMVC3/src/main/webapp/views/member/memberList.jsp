<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.Arrays" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%  --%>
<!-- 	List<Member> members=(List<Member>)request.getAttribute("members"); -->
	
<%-- %> --%>

<jsp:include page="/views/common/header.jsp"/>
<%-- <%@ include file="/views/common/header.jsp" %> --%>
	<style type="text/css">
    section#memberList-container {text-align:center;}
    
    section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
    section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
    
    /* 검색창에 대한 스타일 */
    div#search-container {margin:0 0 10px 0; padding:3px; 
    background-color: rgba(0, 188, 212, 0.3);}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;}
    </style>
    
    <section id="memberList-container">
        <h2>회원관리</h2>
        <div id="search-container">
        	검색타입 : 
        	<select id="searchType">
        		<option value="userId" >아이디</option>
        		<option value="userName" >회원이름</option>
        		<option value="gender" >성별</option>
        	</select>
        	<div id="search-userId">
        		<form action="${pageContext.request.contextPath }/admin/searchMember">
        			<input type="hidden" name="searchType" value="userId" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 아이디를 입력하세요" >
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-userName">
        		<form action="${pageContext.request.contextPath }/admin/searchMember">
        			<input type="hidden" name="searchType" value="userName">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 이름을 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-gender">
        		<form action="${pageContext.request.contextPath }/admin/searchMember">
        			<input type="hidden" name="searchType" value="gender">
        			<label><input type="radio" name="searchKeyword" value="M" >남</label>
        			<label><input type="radio" name="searchKeyword" value="F" >여</label>
        			<button type="submit">검색</button>
        		</form>
        	</div>
        </div>
        <div id="numPerpage-container">
        	페이지당 회원수 : 
        	<form id="numPerFrm" action="">
        		<select name="numPerpage" id="numPerpage">
        			<option value="10">10</option>
        			<option value="5" >5</option>
        			<option value="3" >3</option>
        		</select>
        	</form>
        </div>
        <table id="tbl-member">
            <thead>
                <tr>
                    <th>아이디</th>
				    <th>이름</th>
				    <th>성별</th>
				    <th>나이</th>
				    <th>이메일</th>
				    <th>전화번호</th>
				    <th>주소</th>
				    <th>취미</th>
				    <th>가입날짜</th>
                </tr>
            </thead>
            <tbody>
	       	    <!-- 조회된 결과가 없으면 한줄(row)로 결과가 없습니다 출력하고
		    	조회된 결과가 있으면 각 객체를 tr로 출력하는 구문을 작성할것 -->
		    	<c:if test="${empty members }">
<%-- 		    	<%if(members.isEmpty()) {%> --%>
		    		<tr>
		    			<td><h3>조회된 회원이 없습니다.</h3></td>
		    		</tr>
<%-- 		    	<%}else{ --%>
				</c:if>
				<c:if test="${not empty members }">
		    		<c:forEach var="m" items="${members }">
<!-- 		    		for(Member m : members){ %> -->
			    		<tr>
			    			<td><c:out value="${m.userId }"/></td>
						    <td><c:out value="${m.userName }"/></td>
						    <td><c:out value="${m.gender }"/></td>
						    <td><c:out value="${m.age }"/></td>
						    <td><c:out value="${m.email }"/></td>
						    <td><c:out value="${m.phone }"/></td>
						    <td><c:out value="${m.address }"/></td>
						    <%-- <th><%=Arrays.toString(m.getHobby()) %></th> --%>
						    <td>
<%-- 						    	<c:forEach var="h" items="${members.hobby}"> --%>
<%-- 						    		<c:out value="${h }"/> --%>
<%-- 						    	</c:forEach> --%>
						    	<c:out value="${fn:join(m.hobby,',') }"/>
						    </td>
						    <td><c:out value="${m.enrollDate }"/></td>
			    		</tr>
<%-- 		    	<%} --%>
<%-- 		    	}%> --%>
					</c:forEach>
		    	</c:if>
            </tbody> 
        </table>
        <div id="pageBar">
<%--         	<%=request.getAttribute("pageBar") %> --%>
        	<c:out value="${pageBar }" escapeXml="false"/>
        </div>
    </section>
    	<!-- 검색창 변경 -->
        <script>
	        /* document.querySelector("#searchType").addEventListener("change",e=>{
	            
	        }); */
	        $("#searchType").change(e=>{
	        	const type=$(e.target).val();
	        	$("#search-container>div").hide();
	        	$("#search-"+type).css("display","inline-block");
	        });
        </script>
<jsp:include page="/views/common/footer.jsp"/>
<%-- <%@ include file="/views/common/footer.jsp" %> --%>