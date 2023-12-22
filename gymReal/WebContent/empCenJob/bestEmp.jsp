<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/test.css">
</head>
<body>
	<!-- Links (sit on top) -->
	<div class="w3-top">
		<div class="w3-top fixed-header">
			<div class="w3-row w3-large w3-light-grey">
				<div class="w3-col s3">
					<a href="/gymReal/employees/selectAll.employees"
						class="w3-button w3-block">인사 관리</a>
				</div>
				<div class="w3-col s3">
					<a href="/gymReal/center/selectAll.center"
						class="w3-button w3-block">센터 관리</a>
				</div>
				<div class="w3-col s3">
					<a href="/gymReal/jobHistoryJoin/selectAll.jobHistoryJoin"
						class="w3-button w3-block">직급 관리</a>
				</div>
				<div class="w3-col s3">
					<a href="#contact" class="w3-button w3-block">기타</a>
				</div>
			</div>
			<div class="w3-col s3" style="width: 16.6%;">
				<a href="/gymReal/main.jsp" class="w3-button w3-block">HOME</a>
			</div>

		</div>
	</div>
	<br>
	<div class="w3-content"
		style="max-width: 1000px; margin-top: 80px; margin-bottom: 20px">
		<h3>
			<b>명예의 전당</b>
		</h3>
		<br> <br>
	</div>
	<script>



window.onload = function() {
    sortTableByCommission('desc');
};

function sortTableByCommission(order) {
    sortTable("employees", 2, order); // 2는 '상여금' 열을 가리킵니다.
}
// 나머지 코드는 그대로 유지됩니다.
function sortTable(tableId, column, order) {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById(tableId);
    switching = true;

    while (switching) {
        switching = false;
        rows = table.getElementsByTagName("tr");

        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;

            x = parseFloat(rows[i].getElementsByTagName("td")[column].innerHTML);
            y = parseFloat(rows[i + 1].getElementsByTagName("td")[column].innerHTML);

            if (order === 'desc' && x < y) {
                shouldSwitch = true;
                break;
            }
        }

        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
}

</script>

	<!-- main-->
	<div style="text-align: center; max-width: 1000px; margin: 0 auto;">
		<table border="1" width="90%" id="employees">
			<tr>
				<th>직원 ID</th>
				<th>이름</th>
				<th>상여금</th>
				<th>지점명</th>

			</tr>
			<c:forEach items="${dtos}" var="empCenJob">
				<tr>


					<td>${empCenJob.employee_id}</td>
					<td>${empCenJob.name}</td>
					<td>${empCenJob.commission_pct}</td>
					<td>${empCenJob.centerDto.center_name}</td>


				</tr>
			</c:forEach>
		</table>
	</div>
	<br>

	<!-- Footer -->
	<footer class="w3-container w3-padding-32 w3-light-grey w3-center">
		<a href="#" class="w3-button w3-black w3-margin"> <i
			class="fa fa-arrow-up w3-margin-right"></i>To the top
		</a>
		<div class="w3-xlarge w3-section">
			<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
				class="fa fa-instagram w3-hover-opacity"></i> <i
				class="fa fa-snapchat w3-hover-opacity"></i> <i
				class="fa fa-pinterest-p w3-hover-opacity"></i> <i
				class="fa fa-twitter w3-hover-opacity"></i> <i
				class="fa fa-linkedin w3-hover-opacity"></i>
		</div>
		<p>2023 WelcomeToGym. All rights reserved.</p>
	</footer>

</body>
</html>

<%/*  
<td>
<a href="/gymReal/employeeCenter/selectCenter.employeeCenter?
center_id=${customerHobby.id}&hobby=${customerHobby.hobby.hobby}">
${employeeCenter.name }</a></td>
*/ %>
