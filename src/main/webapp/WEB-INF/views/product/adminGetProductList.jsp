<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>상품 목록</title>

<style>
#searchbutton{ background-color: #5b975b; color: #fff;text-align: center; cursor: pointer; border:2px solid #bbb;}
#searchKeyword{text-align: center; margin: 30px 0px;}
#deleteButton {background-color: #E56059;border: 1px solid #A283E5;width: 100px;height: 32px;border-radius: 8px;color: white;}
#deleteButton:hover {background-color: #F5291E;}
#insertButton {background-color: #A283E5;border: 1px solid #A283E5;width: 100px;height: 32px;border-radius: 8px;color: white;}
#insertButton:hover {background-color: #953acd;}
#updateButton {background-color: #A283E5;border: 1px solid #A283E5;width: 100px;height: 32px;border-radius: 8px;color: white;}
#updateButton:hover {background-color: #953acd;}
#detailButton {background-color: white;border: 1px solid #ccc;width: 100px;height: 32px;border-radius: 8px;}
#detailButton:hover {background-color: #eee;color: #333;}
#pageBox {text-align: center;}
.clear {clear: both;}
table {border: 1px;width: 700px;}
th{text-align: auto;}
td{text-align: left;align-items: center;}
img{width: 100px;}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
<script type="text/javascript">
 $(document).ready(function() {
    $('#deleteButton').click(function() {
       var checkboxes = $("input:checkbox[name='select']:checked").length;
       if(checkboxes>0){
        confirm(" 총 "+checkboxes+" 개의 제품을 삭제하시겠습니까?");
        document.list.submit();
       }
       else{ alert("삭제할 제품을 선택해주세요"); }
    }) 
});
</script>
<script>
$(function(){
	let off = document.getElementById('offsetValue').value;
	let firstnumber = document.getElementById('firstnumber').value;
	let maxPage = '${maxPage}';
	
	for (let i = 0; i <5; i++){
		if(parseInt(document.getElementsByClassName('numberPage')[i].text) == off){
			document.getElementsByClassName('numberPage')[i].style.backgroundColor = "#eee";
		}
		if(parseInt(document.getElementsByClassName('numberPage')[i].text) > maxPage){
			document.getElementsByClassName('numberPage')[i].removeAttribute('href');
		}
	}
	 $('#fisrtPage').click(function(){
		if(off<10){
			this.setAttribute( 'href', './1' );
		}else{
			this.setAttribute( 'href', "./"+(parseInt(firstnumber)-5) );
		}
	});
	$('#lastPage').click(function(){
		this.setAttribute( 'href', './'+(parseInt(firstnumber)+5) );
	});
});	
</script>
</head>
<body>
<input type="hidden" id="offsetValue" value="${paging.nowPage}"/>
<input type="hidden" id="firstnumber" value="${5*paging.page+1}"/>
	<h1>상품 목록</h1>
	<br>

	
<form id="list" name="list" method="post" action="/product/admin/checkdelete">

	<table class="table text-center table-hover container">
<thead><tr>
<th><input type="checkbox" class="individual_product_checkbox" name='all' value='${product.no}' onclick='selectAll(this)'></th>
<th>상품번호</th><th>썸네일</th><th>상품명</th><th>대표카테고리</th><th>하위카테고리</th><th>상품가격</th><th>등록일</th>
</tr></thead>
<c:forEach items="${productList}" var="product">
<tr>
<c:if test="${empty productList }">
		<p>등록된 상품이 없습니다.</p>
</c:if>
	<td class="td_width_1 cart_info_td">
	<input type="checkbox"name='select' class="individual_product_checkbox input_size_20" value="${product.no}" /></td>
    <td>${product.no}</td>
	<td><img src="/resources/product/${product.thumbfile}"alt="${product.thumbfile}" title="${product.thumbfile}" /></td>
	<td>${product.p_name}</td>
    <td id="div1name">
    <c:if test="${product.div1 eq 'feed'}">사료</c:if>
	<c:if test="${product.div1 eq 'snack'}">간식</c:if>
	<c:if test="${product.div1 eq 'clean'}">위생용품</c:if>
	<c:if test="${product.div1 eq 'living'}">생활용품</c:if>
	<c:if test="${product.div1 eq 'healthy'}">건강</c:if></td>
	<td id="div2name">
	<c:if test="${product.div2 eq 'dog'}">강아지</c:if>
	<c:if test="${product.div2 eq 'cat'}">고양이</c:if>
	<c:if test="${product.div2 eq 'friends'}">다른친구들</c:if>
	</td>
    <td><fmt:formatNumber value="${product.price}" pattern="#,### 원" /></td>
	<td>${product.date}</td>
	<td><input type="button" onclick="Upd();" id="updateButton" value="수정">
	<br><br>
    <input type="button" onclick="location.href='/product/admin/productdetail/${product.no}';" id="detailButton" value="자세히보기"></td>
	</tr>
<input type="hidden" name="p_file" value="${product.p_file }">
<input type="hidden" name="thumbfile" value="${product.thumbfile }">	
<input type="hidden" name=nowPage value="${paging.nowPage }">
</c:forEach></table></form>
	<br>
	<input type='button' id="insertButton" onclick="location.href='/product/admin/productinsert';" value="상품등록" />
	<input type="button" id="deleteButton" value="상품삭제" />

<div id="searchKeyword">	
<form action="/product/admin/search/1" method="post">
	<input type="text"  name="searchKeyword" placeholder="상품명을 검색해주세요." />&nbsp;&nbsp;<input type="submit" id=searchbutton value="검색"/>
</form>
</div>

<div class="clear"></div>
	<div id="pageBox">
	<ul class="pagination">
	<li><a id="fisrtPage" href=''>&lt;</a></li>
	<li><a class="numberPage" href="./${5*paging.page+1}">${5*paging.page+1}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+2}">${5*paging.page+2}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+3}">${5*paging.page+3}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+4}">${5*paging.page+4}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+5}">${5*paging.page+5}</a></li>
	<li><a id="lastPage" href="">&gt;</a></li>
	</ul>
	</div>
	<div class="clear"></div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>