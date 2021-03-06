<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>

<title>订餐吧_不仅吃省点,而且吃好点</title>
<!--CSS-->
<link rel="stylesheet" href="css/styles.css" />
<!--Javascript-->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.masonry.js"></script>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
em{font-style:normal;}
a{text-decoration:none;cursor:pointer;color:#666666;}
a:hover{color:#FF6699;}
body{background:url("images/bodybg.jpg") repeat #f5f6f7;color:#666666;font-family:Arial;font-size:12px;}
.fl{float:left;}.fr{float:right;}
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{display:inline-table;}
*html .clearfix{height:1%;}
.clearfix{display:block;}
*+html .clearfix{min-height:1%;}
.demo{width:950px;margin:0 auto;}

/* item_list */
.item_list{position:relative;padding:0 0 50px;}
.item{
	width:226px;background:#fff;overflow:hidden;margin:15px 0 0 0;
	border-radius:4px 4px 4px 4px;
	box-shadow:0 1px 3px rgba(34, 25, 25, 0.2);	
}
.item_t{padding:10px 8px 0;}
.item_t .img{background-color:#FFFFFF;margin:0 auto;position:relative;width:210px;min-height:210px;}
.item_t .img a{display:block;}
.item_t .img a:hover{background:#000;}
.item_t .img a:hover img{filter:alpha(opacity=80);-khtml-opacity:0.8;opacity:0.8;-webkit-transition:all 0.3s ease-out;-khtml-transition:all 0.3s ease-out;}
.item_t .price{
	position:absolute;bottom:10px;right:0px;background-color:rgba(0, 0, 0, 0.2);color:#FFF;
	filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#33000000, endcolorstr=#33000000);
}
.item .btns{display:none;}
.img_album_btn{top:0px;right:0px;position:absolute;background:#ff6fa6;color:#ffffff;height:20px;line-height:20px;width:56px;border-radius:3px;}
.img_album_btn:hover{color:#fff;}
.item_t .title{padding:8px 0;line-height:18px;}
.item_b{padding:10px 8px;}
.item_b .items_likes .like_btn{background:url("images/fav_icon_word_new_1220.png") no-repeat;display:block;float:left;height:23px;width:59px;margin-right:5px;}
.item_b .items_likes em{line-height:23px;display:block;float:left;padding:0px 6px;color:#FF6699;font-weight:800;border:1px solid #ff6fa6;border-radius:3px;}

/* more */
#more{display:block;margin:10px auto 20px;}

/* infscr-loading */
#infscr-loading{bottom:-10px;left:45%;position:absolute;text-align:center;height:20px;line-height:20px;z-index:100;width:120px;}

/* page */
.page{display:none;font-size:18px;height:60px;text-align:center;margin:20px 0 0 0;}
.page_num a,.page_num span{margin:0 2px;background:url("images/page.png") no-repeat;display:inline-block;width:30px;height:28px;line-height:26px;overflow:hidden;}
.page_num a{background-position:-65px 0;color:#FF3333;overflow:hidden;}
.page_num .prev{background-position:1px -33px;}
.page_num .unprev{background-position:1px 0;cursor:default;}
.page_num .next{background-position:-32px 0;}
.page_num .unnext{background-position:-32px -33px;cursor:default;}
.page_num .current{background-position:-99px 0;color:#FFFFFF;}
.page_num .etc{background-position:-172px 8px;}

/* to_top */
.to_top a,.to_top a:hover{background:url("images/gotop.png") no-repeat}
.to_top a{
	background-position:0 0;float:left;height:50px;overflow:hidden;width:50px;position:fixed;bottom:35px;cursor:pointer;right:20px;
	_position:absolute;
	_right:auto;
	_left:expression(eval(document.documentElement.scrollLeft+document.documentElement.clientWidth-this.offsetWidth)-(parseInt(this.currentStyle.marginLeft, 10)||0)-(parseInt(this.currentStyle.marginRight, 10)||20));
	_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop, 10)||20)-(parseInt(this.currentStyle.marginBottom, 10)||20)));
}
.to_top a:hover{background-position:-51px 0px;}
</style>

<script type="text/javascript">
var isWidescreen=screen.width>=1280; 
if(isWidescreen){document.write("<style type='text/css'>.demo{width:750px;}</style>");}
</script>

<script type="text/javascript">
function addCart(field){
	  result=$.ajax({url:"addCart.html?id="+field+"&temp="+Math.random(),async:false});
	  if(result){
		  alert("添加成功!");
	  }else{
		  alert(result);
	  }
}
function buyNow(field){
	  result=$.ajax({url:"addCart.html?id="+field+"&temp="+Math.random(),async:false});
	  if(result){
		  location="aliPay.html";
	  }else{
		  alert("添加失败,请重试!");
	  }
}
function addLike(field){
	  result=$.ajax({url:"addLikeGoods.html?id="+field+"&temp="+Math.random(),async:false});
	  if(result){
		  $("#like"+field).html(parseInt($("#like"+field).html())+1);
	  }else{
		  alert("添加失败,请重试!");
	  }
}
function item_masonry(){ 
	$('.item img').load(function(){ 
		$('.infinite_scroll').masonry({ 
			itemSelector: '.masonry_brick',
			columnWidth:226,
			gutterWidth:15								
		});		
	});
		
	$('.infinite_scroll').masonry({ 
		itemSelector: '.masonry_brick',
		columnWidth:226,
		gutterWidth:15								
	});	
}

$(function(){

	function item_callback(){ 
		
		$('.item').mouseover(function(){
			$(this).css('box-shadow', '0 1px 5px rgba(35,25,25,0.5)');
			$('.btns',this).show();
		}).mouseout(function(){
			$(this).css('box-shadow', '0 1px 3px rgba(34,25,25,0.2)');
			$('.btns',this).hide();		 	
		});
		
		item_masonry();	

	}

	item_callback();  

	$('.item').fadeIn();

	var sp = 1
	
	$(".infinite_scroll").infinitescroll({
		navSelector  	: "#more",
		nextSelector 	: "#more a",
		itemSelector 	: ".item",
		
		loading:{
			img: "images/masonry_loading_1.gif",
			msgText: ' ',
			finishedMsg: '木有了',
			finished: function(){
				sp++;
				if(sp>=10){ //到第10页结束事件
					$("#more").remove();
					$("#infscr-loading").hide();
					$("#page").show();
					$(window).unbind('.infscr');
				}
			}	
		},errorCallback:function(){ 
			$("#page").show();
		}
		
	},function(newElements){
		var $newElems = $(newElements);
		$('.infinite_scroll').masonry('appended', $newElems, false);
		$newElems.fadeIn();
		item_callback();
		return;
	});

});
</script>
<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
<![endif]-->
<!-- mobile setting -->
</head>
<body>
<div class="wrapper">
    <div class="header_container">
        <!--Header Starts-->
        <c:import url="/header.html" charEncoding="UTF-8"></c:import>
        <!--Header Ends-->
    </div>
    <div class="navigation_container">
        <!--Navigation Starts-->
		<c:import url="/navigation.html" charEncoding="UTF-8"></c:import>
        <!--Navigation Ends-->
    </div>
    <div class="section_container">
        <!--Mid Section Starts-->
        <section>
            <!--SIDE NAV STARTS-->
            <div id="side_nav">
                <div class="sideNavCategories">
                	<img src="${shop.signboardUrl }" alt="Img">
                    <h1>${shop.shopName }</h1>
					<ul class="category departments">
						<li class="header">订房电话：${shop.feixin }</li>
					</ul>
					<ul class="category departments">
						<li class="header">客官注意哦：</li>
						<c:choose>
						   <c:when test="${empty shop.shopDescription }"><li>请在当天12点之前预订，否则会爆满</li>
						   </c:when>
						   <c:otherwise><li>${shop.shopDescription }</li>
						   </c:otherwise>
						</c:choose>						
						
					</ul>
                </div>
            </div>
            <!--SIDE NAV ENDS-->
            <!--MAIN CONTENT STARTS-->
            <div id="main_content">
                <div class="category_banner"> <img src="images/promo_cat_banner.jpg" /> </div>
                <ul class="breadcrumb">
                    <li><a href="index.html">首页</a></li>
                    <li><a href="shopList.html">所有商家</a></li>
                    <li class="active"><a>${shop.shopName }</a></li>
                </ul>
                <!--Product List Starts-->
				<div class="demo clearfix">
					<div class="item_list infinite_scroll">
						<c:forEach items="${goodsList}" var="goods">
						<div class="item masonry_brick">
							<div class="item_t">
								<div class="img">
									<a href="product.html?id=${goods.goods.goodsId }"><img width="210" height="240" alt="${goods.goods.goodsName }" src="${goods.goods.goodsUrl }" /></a>
									<span class="price">￥${goods.goods.priceDiscount }</span>
									<div class="btns">
										<a onclick="addCart(${goods.goods.goodsId })" class="img_album_btn">加入餐车</a>
									</div>
								</div>
								<div class="title"><span>${goods.goods.goodsName  }</span></div>
							</div>
							<div class="item_b clearfix"> 
								<div class="items_likes fl">
									<a class="like_btn" onclick="addLike(${goods.goods.goodsId} )"></a>
									<em class="bold" id="like${goods.goods.goodsId}">${goods.like}</em>
								</div>
								<div class="items_comment fr"><a onclick="buyNow(${goods.goods.goodsId })">立即购买</a><em class="bold">(${goods.sale})</em></div>
							</div>
						</div><!--item end-->			
						</c:forEach>
					</div>
				</div>
                <!--Product List Ends-->
            </div>
            <!--MAIN CONTENT ENDS-->
        </section>
        <!--Mid Section Ends-->
    </div>
    <div class="footer_container">
        <!--Footer Starts-->
		<footer>
		<c:import url="/footer.html" charEncoding="UTF-8"></c:import>
		</footer>
        <!--Footer Ends-->
    </div>
</div>

</body>
</html>
