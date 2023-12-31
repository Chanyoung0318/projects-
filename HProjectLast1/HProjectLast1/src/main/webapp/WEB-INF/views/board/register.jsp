<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/ex/resources/css/template.css" />
<link rel="stylesheet" type="text/css" href="/ex/resources/css/hh.css" />

<style>
textarea {
	resize: none;
}

 input {
    border: 1px solid #ddd; 
    margin:10px;
  }


  textarea {
    border: 1px solid #ddd; 
    margin:10px;
  }
  
  .fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted blue;
}
small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>

<script>
function validateForm() {
    // 필수 입력 필드 값을 가져옵니다.
    var title = document.getElementsByName("bTitle")[0].value;
    var content = document.getElementsByName("bContent")[0].value;
    var writer = document.getElementsByName("bName")[0].value;

    // 각 필드가 비어있는지 확인합니다.
    if (title === "" || content === "" || writer === "") {
        // 경고창을 표시합니다.
        alert("제목, 내용, 작성자 중 하나라도 입력되지 않았습니다. 모든 항목을 입력해주세요.");
        return false; // 폼 전송을 막습니다.
}
    // 유효성 검사가 통과한 경우 true를 반환하여 폼이 전송되도록 합니다.
    return true;
}


$(document).ready(function() {
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".btn-list").on("click", function() {
		self.location = "/ex/board/listAll";
	});
});

</script>


<div class="row">
	<div class="side">
		<a href="/ex/board/listAll" class="right">전체글보기</a><br>
		<hr>
		<a href="/ex/board/register" class="right">글쓰기</a><br>
		<hr>

		<c:forEach items="${category}" var="item">
			<c:if test="${item eq '공지사항'}">
				<img src='/ex/resources/img/noties.png'>
				<a href="/ex/board/listAll?bGroupKind=${item}">${item}</a>
				<br>
			</c:if>
		</c:forEach>
		<c:forEach items="${category}" var="item">
			<c:if test="${item ne '공지사항'}">
				<img src='/ex/resources/img/read.png'>
				<a href="/ex/board/listAll?bGroupKind=${item}">${item}</a>
				<br>
			</c:if>
		</c:forEach>
		<hr>
	</div>

  	<div class="mainregister" style="border: 1px solid #ddd; border-radius: 10px; ">
 		<h3 class="box-title">글쓰기</h3>
		<hr>
		
	<!-- /.box-header -->
	<!-- action에 경로가 없으면 현재 페이지 주소로 이동한다.-->
		
		<form role="form" method="post" onsubmit="return validateForm();">

			<select name="bGroupKind" id="category" style="margin:10px; width:250px; height:35px;">
				<option value="" disabled selected hidden>게시판을 선택해주세요.</option>
            	<option id="free" value="자유게시판">자유게시판</option>
            	<option id="hot" value="인기게시판">인기게시판</option>
            	<option id="humor" value="유머게시판">유머게시판</option>
            	<option id="advice" value="고민게시판">고민게시판</option>
        	</select> 
	
			<h5>
			<input type="text" name='bTitle' placeholder="제목을 입력해주세요" style="width:500px; height:35px;">
			<textarea name="bContent" rows="8" style="width:800px; height:300px;" placeholder="내용을 입력하세요."></textarea>
			<input type="text" name="bName"  placeholder="작성자" style="width:800px; height:35px;">
			</h5> 
		

	<!-- /.box-body -->

			<div class="box-footer">
				<button type="submit" class="btn btn-save" style="background-color: lightblue;  margin-top:10px;">등록</button>
				<button type="button" class="btn btn-list" style="background-color: lightblue;  margin-top:10px;">목록</button>

			</div>	
		</form>
	</div>
</div>
		
<%@include file="../include/footer.jsp"%>