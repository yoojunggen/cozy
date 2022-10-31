<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>상품등록</title>
<style>
.detailimgs{width: 200px; height: 200px;}
#thuimg{width: 200px; height: 200px;}
.detailbutton{ background-color: #5b975b; color: #fff;text-align: center; padding: 10px 0; width: 20%; border-radius: 6px; cursor: pointer; margin:18px 10px 18px 10px;
border:1px solid #bbb;}
#sogae{margin-bottom: 20px;}
#thu{margin-bottom: 20px;}
#p_name{width: 80%;}
#Title{border-bottom:1px solid #bbb; padding:23px 0 30px 0; margin:60px 10% 50px 10%; text-align: left;}
.inputArea{text-align:left; margin:10px 10% 20px 10%; }
#insb{background-color:#A283E5;  border:1px solid #A283E5; width:100px; height:32px; border-radius: 8px; color:white; }
#insb:hover{background-color: #953acd;}
.clear{clear:both;}
.file-label {margin-top: 30px; background-color: #5b975b; color: #fff;text-align: center; padding: 10px 0; width: 20%; border-radius: 6px;
  cursor: pointer; margin:18px 10px 18px 10px;}
#chooseFile {display: none;}
.upload-box {width: 100%; box-sizing: border-box; margin-right: 30px; display: flex; flex-direction: column; justify-content: center;
  align-items: left;}
.upload-box .drag-file {position: relative; width: 200px; height: 200px; display: flex; flex-direction: column; justify-content: center;
  align-items: center; border: 3px dashed #dbdbdb;}
.upload-box .drag-file #miriimg {width: 100px;}
.upload-box .drag-file .message {margin-bottom: 0;}
.upload-box .drag-file .preview {display: none; position: absolute; left: 0; height: 0; width: 100%; height: 100%;} 
</style>
<script>
      function setThumbnail(event) {
        var reader = new FileReader();
          reader.onload = function(event) {
        	
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          img.id="thuimg";
          document.querySelector("div#thumbimg_container").appendChild(img);
         
          var header = document.querySelector("#dropfile");	//제거하고자 하는 엘리먼트
    	  header.parentNode.removeChild(header);
         };

        reader.readAsDataURL(event.target.files[0]);
      }
</script>

<script>
      function detailimg(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          img.setAttribute("class","detailimgs" );
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
</script>
<script>
    var cnt = 1;
    function fn_addFile(){
    	 
    	$("#image_container").append("<input multiple='multiple' type='file' name='img' onchange='detailimg(event)' required; /> "+ "<br/>");
        cnt++;
      }
</script>
</head><body>
<h1 id="Title">상품상세수정</h1><hr>
		<form action="productinsert" method="post" enctype="multipart/form-data">
		
		    <div class="inputArea"><label>상품명 : </label>&nbsp;
			<input type="text" id="p_name" name="p_name" value="${productDetail.p_name}"/>
            </div>
            
	    <div class="inputArea">        
        
        <label>용품종류 : </label>&nbsp;&nbsp;<span>
        <c:if test="${productDetail.div1 eq 'feed'}">사료</c:if>
	    <c:if test="${productDetail.div1 eq 'snack'}">간식</c:if>
	    <c:if test="${productDetail.div1 eq 'clean'}">위생용품</c:if>
	    <c:if test="${productDetail.div1 eq 'living'}">생활용품</c:if>
	    <c:if test="${productDetail.div1 eq 'healthy'}">건강</c:if></span>&nbsp;&nbsp;
        <select id="selectOption1" name="div1">
        <option >선택해주세요</option>        
        <option value="feed">사료</option>
        <option value="snack">간식</option>
        <option value="clean">위생용품</option>
        <option value="living">생활용품</option>
        <option value="healthy">건강</option>
        </select>
     
       <label>반려동물 : </label>&nbsp;&nbsp;<span>
        <c:if test="${productDetail.div2 eq 'dog'}">강아지</c:if>
	    <c:if test="${productDetail.div2 eq 'cat'}">고양이</c:if>
	    <c:if test="${productDetail.div2 eq 'friends'}">다른친구들</c:if></span>&nbsp;&nbsp;
        <select id="selectOption2" name="div2">
        <option >선택해주세요</option>        
        <option value="dog">강아지</option>
        <option value="cat">고양이</option>
        <option value="friends">다른친구들</option>
        </select>
        <br></div>
           <div class="inputArea"><label>상품가격(원) : </label>&nbsp;&nbsp;
		<input type="text" id="price" name="price"  maxlength="10" value="${productDetail.price}"/>
			</div>
		
	 <div class="inputArea">
		<label id="thu">대표 이미지</label>
			<div class="upload-box">
				<div id="dropfile" class="drag-file">
					<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" id="miriimg" >
					<p class="message">이미지 미리보기</p>
			   </div>
				     <div id="thumbimg_container"></div>
				<label class="file-label" for="chooseFile">썸네일 등록</label>  
		      <input id="chooseFile" class="file" name=thumbimg type="file" onchange="setThumbnail(event);" accept="image/*"/>
              </div></div>
              
            <div class="clear"></div>

		<div class="inputArea">
			<label id="sogae">상품소개</label>
			<br/>
			<textarea rows="5" cols="50" id="text" name="text">"${productDetail.text}"</textarea>
		</div>
		
	    <div class="clear"></div>
		
		<div class="inputArea">
			<div id="imgbox">
			<div id="image_container"></div>
			</div>
			<div class="clear"></div>
			<input type="button" value="상세이미지등록" onClick="fn_addFile()" class=detailbutton />
			<br/>
		</div>

		<div class="clear"></div>

		<div class="inputArea" style="float: right;">
			<input type="submit" id=insb value="수정완료" />
		</div>
	</form>
	    
	    <div class="clear"></div>


</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>