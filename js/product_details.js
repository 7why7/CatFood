//动态获取产品数据
var jumpLid=location.search.split("=")[1]||" ";
$.ajax({
	type:"GET",
	url:"data/product_details.php",
	data:{lid:jumpLid},
	success:function(data){
		var html="";
		html+=`
			<img id="mdImg" src="${data[0].lg}" alt="">
			<div class="s1_litDiv" id="little"></div>
			<div id="s1_flow"></div>	
		`
		$(".s1_mdImg").html(html);
		var myurl=`${data[0].lg}`;
//		console.log(myurl);
		$(".s1_bigImg").css("backgroundImage",`url(${myurl})`);
		//放大镜实现
		var little=document.getElementById("little");
		var bigImg=document.getElementById("bigImg");
		var sFlow=document.getElementById("s1_flow");
		sFlow.onmouseover=function(){
			little.style.display="block";
			bigImg.style.display="block";
		}
		sFlow.onmouseout=function(){
			little.style.display="none";
			bigImg.style.display="none";
		}
		sFlow.onmousemove=function(e){
			var x=e.offsetX,y=e.offsetY;
			if(y-113<0){y=113;}else if(y+113>400){y=400-113;}
			if(x-113<0){x=113;}else if(x+113>400){x=400-113;}
			little.style.top=y-113+"px";
			little.style.left=x-113+"px";
			bigImg.style.backgroundPosition=-(x-113)*2+"px "+-(y-113)*2+"px";
		}
		//添加小商品
//		console.log(data.length);
		html="";
		for(var i=0;i<data.length;i++){
			html+=`
				<li><a href=""><img data-getImg="${data[i].lg}" src="${data[i].lg}" alt=""></a></li>
			`
		}
		$(".s1_sm").html(html);
		//左右点击事件
		var smLeft=0;
		var allLength=60*(data.length-1);
//		console.log(-allLength);
		$(".s1_smLeft").on("click",function(e){
			e.preventDefault();
			smLeft=smLeft-60;
			if(smLeft<=-allLength){smLeft=-allLength;}
			$(".s1_sm").css("left",`${smLeft}px`);
		})
		$(".s1_smRight").on("click",function(e){
			e.preventDefault();
			smLeft=smLeft+60;
			if(smLeft>=0){smLeft=0;}
			$(".s1_sm").css("left",`${smLeft}px`);
		})
		//鼠标移入小图片的事件
		$(".s1_sm").on("mouseover","li>a>img",function(e){
			var tar=e.target;
//			console.log(tar);
//			console.log(this);
//			console.log($(this).attr("data-getimg"));
			var overChgImg=$(this).attr("data-getimg");
			$(".s1_bigImg").css("backgroundImage",`url(${overChgImg})`);
			$("#mdImg").attr("src",overChgImg);
		})
		//添加详细信息
		$.ajax({
			type:"get",
			url:"data/product_details2.php",
			data:{lid:jumpLid},
			async:false,
			success:function(dataRight){
			var html="";
//			console.log(dataRight);
//			console.log(dataRight[0].price);
			html+=`
				<h1>欢迎来到喵pr购物，我们将致力提供营养健康，物美价廉的宠物食品。让你的宠物吃得健康，吃得开心。</h1>
					<div class="right_details">
						<p>售价：<span class="Price">￥${dataRight[0].price}</span></p>
						<h2>服务承诺：Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, necessitatibus, rem voluptatum nihil laudantium veritatis dicta libero doloribus eaque nulla aliquam sit deserunt eligendi dolor vero ea adipisci architecto. Temporibus.</h2>
					</div>
					<h3>产品详细信息：${dataRight[0].title}</h3>
					<div class="proNub">
						数量：
						<a class="decNub" href="">-</a>
						<input class="proNum" type="text" value=1>
						<a class="addNub" href="">+</a>
					</div>
					<div class="burPro">
						<a href="" class="nowBuy">立即购买</a>
						<a href="" class="addCart">加入购物车</a>
						<a href="">收藏</a>
					</div>	
			`;
			$(".s1_bot_right").html(html);
//			实现添加购物车和立即购买的功能
			var num=$(".proNum").val();
//			加减操作
			$(".decNub").on("click",function(e){
				e.preventDefault();
				if(num<=1){
					num=1;
				}else{
					num--;
				}
				$(".proNum").val(num);
			});
			$(".addNub").on("click",function(e){
				e.preventDefault();
				num++;
				$(".proNum").val(num);
			})
//			添加购物车
				var proid=jumpLid;
				var thisPrice=dataRight[0].price;
				var count=$(".proNum").val();
			$(".nowBuy").on("click",function(e){
				e.preventDefault();
				$.ajax({
					type:"POST",
					async:false,
					url:"data/product_cartadd.php",
					data:{pid:proid,price:thisPrice,count:count},
					success:function(){
						location.href="goBuy.html";
					},
					error:function(){}
				});
			})
			$(".addCart").on("click",function(e){
				e.preventDefault();
				$.ajax({
					type:"POST",
					async:false,
					url:"data/product_cartadd.php",
					data:{pid:proid,price:thisPrice,count:count},
					success:function(){
						alert("添加成功");
					},
					error:function(){}
				});
			})
			},
			error:function(){alert("网络请求错误请检查")}
		})
	},
	error:function(){alert("网络错误，请检查QAQ")}
})