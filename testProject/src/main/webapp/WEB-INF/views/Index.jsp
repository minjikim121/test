<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
</head>
 
<body> 
	<fmt:formatDate value="${date}" pattern="yyyyMMdd" var="today"/>
	<fmt:formatDate value="${date}" pattern="yyyy" var="nowYear"/>
	<c:forEach items="${insDateList}" var="item">
		<fmt:parseDate value="${item.insDate}"  pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" type="both" />				
		<fmt:parseNumber var="diffTime" value="${(date.time - parsedDate.time) / 60000}" integerOnly="true" />
		<fmt:formatDate var="insYear" value="${parsedDate}" pattern="yyyy" type="both"/>
		<fmt:formatDate var="insDate" value="${parsedDate}" pattern="yyyyMMdd" type="both"/>
		<c:choose>
			<c:when test="${diffTime lt 1}"> <!--1분 이내일 경우 -->
				<p>방금</p>
			</c:when>
			<c:when test="${diffTime ge 1 && diffTime lt 60}">  <!--60분 이내일 경우 -->
				<p>${diffTime}분 전</p>
			</c:when>
			<c:when test="${diffTime ge 60 && diffTime lt 420}">  <!--60분 이후 또는 7시간 이내일 경우 -->
				<fmt:parseNumber var="diffHour" value="${diffTime / 60}" integerOnly="true" />
				<p>${diffHour}시간 전</p>
			</c:when>
			<c:when test="${diffTime ge 420 && today eq insDate}"> <!-- 7시간 이후면서 당일일 경우 -->
				<fmt:formatDate var="insTime" value="${parsedDate}" pattern="HH:mm" />
				<p>${insTime} : 당일</p> 
			</c:when>
			<c:when test="${diffTime ge 420 && diffTime le 10079}"> <!-- 하루 ~ 7일 전 날일 경우 -->
				<fmt:parseNumber var="diffDays" value="${diffTime / 1440}" integerOnly="true" />
				<c:choose>
					<c:when test="${diffDays eq 0 }">
						<p>1일 전</p>
					</c:when>
					<c:otherwise>
						<p>${diffDays }일 전</p>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${diffTime ge 10080 && nowYear eq  insYear}"> <!-- 7일 보다 크면서 같은 년도일 경우 -->
				<fmt:formatDate var="insDate" value="${parsedDate}" pattern="MM.dd" />
				<p>${insDate} : 당해</p>
			</c:when>
			<c:when test="${diffTime ge 10080 && nowYear ne  insYear}"> <!-- 7일 보다 크면서 다른 년도일 경우 -->
				<fmt:formatDate var="insDateWithYear" value="${parsedDate}" pattern="yyyy.MM.dd" />
				<p>${insDateWithYear} : 작년</p>
			</c:when>
		</c:choose>
	</c:forEach>

</body>
</html>
