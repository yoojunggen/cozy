<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<title>empList</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	.as {
		color:black; 
		font-size : 18px; 
		text-decoration: none;
		float:right;
	}
	.as:hover {
		text-decoration: none;
		color:#A283E5
	}
				
	
   .carousel-inner img {
    width: 100%;
    height: 400px;
  }

	
	
	
	
	
	
	div.gallery {
  border: 1px solid #ccc;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}

* {
  box-sizing: border-box;
}

.responsive {
  padding: 0 6px;
  width: 15%;
  float : left;
  margin-left : 10%;
}
.banner {width:100%;}

@media only screen and (max-width: 700px) {
  .responsive {
    width: 49.99999%;
    margin: 6px 0;
  }
}

@media only screen and (max-width: 500px) {
  .responsive {
    width: 50%;
  }
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}
	
.benner-section{
	margin-bottom:75px;
}
.topMargin{margin-top:90px;}

.mid-content{

}
#hotTitle{font-family: 'Jua', sans-serif !important; color:#555; font-size:35px;}
.fire{font-size:29px; color: #be0000;}
.pushpin{font-size:25px; opacity:0.7;}
.productImage{width:100%; padding:11%;}
.productName{font-size: 20px;  text-align:center;}
.productPrice{font-size: 18px;  text-align:center;}
.clear{clear:both;}
#p_nameBox{margin-top:8px; height:58px; overflow: hidden; text-overflow:ellipsis; display:-webkit-box; -webkit-line-clamp: 2 !important; -webkit-box-orient: vertical;}
.center{text-align:center;}
.detailButton{background-color: #fcaa06; border:0px solid white; color:white; padding:2.5px 8px; border-radius:8px; font-family: 'Sunflower', sans-serif; font-size:16px;}
.moongoo{text-align:center; font-family: "Allerta Stencil",'Jua', Sans-serif; font-size:40px; padding-top:75px; color:#777;}
.hashTag{font-family: "Allerta Stencil",'Jua', Sans-serif; font-size:27px; color:#777; opacity: 0.8; text-decoration: none;}
.hashTag:hover{color:#fcaa06;}
.center{text-align:center;}
</style>



</head><body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
 <div class="benner-section">
            <div class="mid-content">
                <div class="benner-primari t-center">
                        <img class="banner" src="/resources/banner7.jpg" alt="Los Angeles"/>
                </div>
                <div class="moongoo">????????? ????????? COZY???~</div>
                <div class="center"><a class="hashTag" href="/product/list/feed/cat">#??????_??????</a> &nbsp;<a class="hashTag" href="/product/list/clean/dog">#?????????_??????</a> &nbsp;<a class="hashTag" href="/product/list/clean/friends">#??????_??????</a></div>
            </div>
        </div>
</div>

<div class="col-md-1"></div>
</div>

 <div class="row">
 <div class="col-md-2"></div>
  <div class="col-md-8">
  	<div class="col-sm-1 col-xs-1"></div>
  		<div class="col-md-12 col-sm-10 col-xs-10">
  		<h2 id="hotTitle">H<span class="glyphicon glyphicon-fire fire"></span>T??? ??????</h2></div><div class="col-sm-1 col-xs-1"></div><div class="clear"></div>
  			<div class="row">
  			
  			<c:forEach items="${productList}" var="product">
	<div class="col-md-3 col-sm-6">
	<a href="/product/productDetail/${product.no}"><img class="productImage" src="/resources/product/${product.thumbfile}" alt="${product.p_name}????????? ?????????" title="${product.p_name} ?????????"/></a>
	<p class="productName" id="p_nameBox">${product.p_name}</p>
	<p class="productPrice">${product.price}???</p>
	<div class="center">
	<button type="button" class="detailButton" onclick="location.href='/product/productDetail/${product.no}'">????????? ??????</button>
	</div>
	</div>
	</c:forEach>
		</div>
</div>
<div class="col-md-2"></div>
</div>

<div class="clear"></div>


 <div class="row topMargin">
 <div class="col-md-2"></div>
  <div class="col-md-8">
	<div class="col-sm-1 col-xs-1"></div>
  		<div class="col-md-12 col-sm-10 col-xs-10">

  	<h2 id="hotTitle">?????? PICK <span class="glyphicon glyphicon-pushpin pushpin"></span></h2></div><div class="col-sm-1 col-xs-1"></div><div class="clear"></div>
 <div class="row">

 		<c:forEach items="${productList}" var="product">
	<div class="col-md-3 col-sm-6">
	<img class="productImage" src="/resources/${product.p_file}" alt="${product.p_file}????????? ?????????" title="${product.p_file} ?????????"/>
	<p class="productName" id="p_nameBox">${product.p_name}</p>
	<p class="productPrice">${product.price}???</p>
	<div class="center">
	<button type="button" class="detailButton" onclick="location.href='/product/productDetail/${product.no}'">????????? ??????</button>
	</div>
	</div>
	</c:forEach>
	
</div>
</div>
<div class="col-md-2"></div>
</div>

<div class="clear"></div>

<div class="row topMargin">
 <div class="col-md-2"></div>
  <div class="col-md-8">
<div class="col-md-12">
  	<h2 id="hotTitle">COZY ?????? ?????? ??????</h2></div>
 <div class="row">
 <div class="col-md-3 col-sm-6">
		<img class="productImage"  src="/resources/img10.jpg"/>
		<p class="productName">?????? ?????? ?????? 1.5kg</p>
		<p class="productPrice">99,000???</p>
	</div>
	<div class="col-md-3 col-sm-6">
		<img class="productImage"  src="/resources/img20.jpg"/>
		<p class="productName">?????? ??????</p>
		<p class="productPrice">99,000???</p>
	</div>
	<div class="col-md-3 col-sm-6">
		<img class="productImage"  src="/resources/img1.jpg"/>
		<p class="productName">?????? ??????</p>
		<p class="productPrice">99,000???</p>
	</div>
	<div class="col-md-3 col-sm-6">
		<img class="productImage"  src="/resources/img10.jpg"/>
		<p class="productName">?????? ??????</p>
		<p class="productPrice">99,000???</p>
	</div>
</div>
</div>
<div class="col-md-2"></div>
</div>

<div class="clear"></div>
<script>
window.history.forward(); function noBack(){ 
	  window.history.forward();
	}
</script>


</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>