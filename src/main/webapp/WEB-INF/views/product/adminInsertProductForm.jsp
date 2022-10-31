<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
#previewthumb{width: 300px; height: 300px;}
#thumbbox{margin-bottom: 20px;}
.detailbutton{ background-color: #5b975b; color: #fff;text-align: center; padding: 10px 0; width: 20%; border-radius: 6px; cursor: pointer; margin:18px 10px 18px 10px;
border:1px solid #bbb;}
#sogae{margin-bottom: 20px;}
.thu{margin-bottom: 20px;}
#p_name{width: 80%;}
#Title{border-bottom:1px solid #bbb; padding:23px 0 30px 0; margin:60px 10% 50px 10%; text-align: left;}
.inputArea{text-align:left; margin:10px 10% 20px 10%; }
#insb{background-color:#A283E5;  border:1px solid #A283E5; width:100px; height:32px; border-radius: 8px; color:white; }
#insb:hover{background-color: #953acd;}
.clear{clear:both;}
#att_zone{ width: 515px; min-height:150px; padding:10px; border: 2px solid #bbb; margin:20px 0px 40px 0px; }
#att_zone:empty:before{ content : attr(data-placeholder);color : #999;font-size:.9em;}
</style>
<script>
function readURL(input) {
	if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function(e) {
    	   document.getElementById('previewthumb').src = e.target.result;
    	   };
         reader.readAsDataURL(input.files[0]);
         } else {
        document.getElementById('previewthumb').src = "";
             }
	}
</script>
<!-- <script>
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
</script>-->
<script>

</script>
</head><body>
<h1 id="Title">상품등록</h1><hr>
		<form action="productinsert" method="post" enctype="multipart/form-data">
		
		    <div class="inputArea"><label>상품명 : </label>&nbsp;
			<input type="text" id="p_name" name="p_name" autofocus="autofocus" placeholder="상품명을 입력해주세요." required />
            </div>
            
	    <div class="inputArea">        
        <label>용품종류 : </label>&nbsp;&nbsp;
        <select id="selectOption1" name="div1">
        <option >선택해주세요</option>        
        <option value="feed">사료</option>
        <option value="snack">간식</option>
        <option value="clean">위생용품</option>
        <option value="living">생활용품</option>
        <option value="healthy">건강</option>
        </select>
        <br><br>
        <label>반려동물 : </label>&nbsp;&nbsp;
        <select id="selectOption2" name="div2">
        <option >선택해주세요</option>        
        <option value="dog">강아지</option>
        <option value="cat">고양이</option>
        <option value="friends">다른친구들</option>
        </select>
        <br></div>
           <div class="inputArea"><label>상품가격(원) : </label>&nbsp;&nbsp;
		<input type="text" id="price" name="price"  maxlength="10" placeholder="숫자만 입력해주세요." required/>
			</div>
		
	 <div class="inputArea">
		<label  class="thu">대표 이미지</label>
  <div id="thumbbox"><br>
    <img id="previewthumb" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
  </div>
    <input type="file" id="input-image"  name=thumbimg accept="image/*" onchange="readURL(this);">
         </div>
        
            <div class="clear"></div>
     <div class="inputArea">
			<label id="sogae">상품소개</label>
			<br/>
			<textarea rows="5" cols="50" id="text" name="text" required ></textarea>
		</div>
		
	    <div class="clear"></div>
		<!-- 	<div class="inputArea">
			<div id="imgbox">
			<div id="image_container"></div>
			</div>
			<div class="clear"></div>
			<input type="button" value="상세이미지등록" onClick="fn_addFile()" class=detailbutton />
			<br/>
		</div>   -->
		
		 <div class="inputArea">
		 <label class="thu">상세 이미지</label>
		<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 해주세요.'></div>
	      <input type='file' id='btnAtt' multiple='multiple' name="img"/>
        </div>
      

		<div class="clear"></div>

		<div class="inputArea" style="float: right;">
			<input type="submit" id=insb value="등록하기" />
		</div>
	</form>
	    
	    <div class="clear"></div>
<script>
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){

    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:150px;height:120px;margin:5px;border:2px solid #bbb;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:10px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(0,0,0,0);color:#bbb';
  
    btnAtt.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
      
    }, false)
    

    
    /*첨부된 이미리들을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'btnAtt')

</script>

</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>