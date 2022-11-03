<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/yg/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<h2>공지사항</h2>
		<table class="table">
			<c:forEach var="notice" items="${notice }">
				<tr>
					<td>${notice.noticeNo }</td>
					<td class="col-9"><a href="/noticeview?noticeNo=${notice.noticeNo }">${notice.title }</a></td>
					<td><fmt:formatDate value="${notice.writeDate }"
							pattern="yyyy.MM.dd" /> | <img src="/images/eye.png">
						${notice.views }
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
			<ul>
				<c:if test="${pvo.prev }">
					<li><a href="announce${pvo.makeQuery(pvo.startPage - 1) }">이전</a>
				</c:if>
				<c:forEach begin="${pvo.startPage }" end="${pvo.endPage }" var="cnt">
					<li><a href="announce${pvo.makeQuery(cnt) }">${cnt }</a></li>
				</c:forEach>
				<c:if test="${pvo.next && pvo.endPage > 0 }">
					<li><a href="announce${pvo.makeQuery(pvo.endPage + 1) }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/yg/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />