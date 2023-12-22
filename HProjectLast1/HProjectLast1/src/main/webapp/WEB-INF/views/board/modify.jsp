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
</style>



<!-- 카테고리 -->
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
	


  	<div class="mainregister" id="loading-main" style="border: 1px solid #ddd; border-radius: 10px; ">
  
		<form role="form" method="post">

		<h3 class="box-title">글 수정</h3><hr>
	
		<select name="bGroupKind" id="category" style="margin:10px; width:250px; height:35px;">
			<option value="" disabled selected hidden>게시판을 선택해주세요.</option>
         	<option id="free" value="자유게시판">자유게시판</option>
          	<option id="hot" value="인기게시판">인기게시판</option>
          	<option id="humor" value="유머게시판">유머게시판</option>
          	<option id="advice" value="고민게시판">고민게시판</option>
     	</select>

		<div class="box-body">
			<h5>
			<input type="hidden" name='bId' value="${boardDto.bId}" readonly="readonly">

			<input type="text" name='bTitle'  style="width:500px; height:35px; margin:10px;" value="${boardDto.bTitle}">
		
			<textarea  style="width:800px; height:300px; margin:10px;" name="bContent">${boardDto.bContent}</textarea>
			</h5><br>	
		</div>
	</form>
	
	
	<!-- /.box-body -->
		<div class="box-footer">
			<button type="submit" class="btn btn-save" style="background-color: lightblue;">등록</button>
			<button type="button" class="btn btn-list" style="background-color: lightblue;">취소</button>
		</div>
	
		<script>
			$(document).ready(function() {
				var formObj = $("form[role='form']");
				console.log(formObj);
				 $(".btn-list").on("click", function() {
				        // 현재 페이지의 URL에서 bGroup, bStep, bId를 가져오기
				        var urlParams = new URLSearchParams(window.location.search);
				        var currentBGroup = urlParams.get('bGroup');
				        var currentBStep = urlParams.get('bStep');
				        var currentBId = urlParams.get('bId');

				        // bGroup이 같고 bStep이 현재 글의 bStep-1인 글로 이동
				        if (currentBGroup !== null && currentBStep !== null) {
				            self.location = "/ex/board/read?bGroup=" + currentBGroup + "&bStep=" + (parseInt(currentBStep) - 1) + "&bId=" + currentBId;
				        } else {
				            // 현재 페이지의 URL에서 bGroup과 bStep이 없는 경우 기본 read 페이지로 이동
				            self.location = "/ex/board/read?bId=" + currentBId;
				        }
				    });
			
				$(".btn-save").on("click", function() {
					formObj.submit();
				});
			});
		</script>
	</div>
</div>
		
<%@include file="../include/footer.jsp"%>