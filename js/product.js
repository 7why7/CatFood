//搜索框的实现

//封装一个函数，传入的值是pno，根据pno加载页面。
function productLoad(pno){
	var kw=location.search.split("=")[1]||" ";
	$.ajax({
	type:"GET",
	url:"data/product.php",
	data:{kw:kw,pno:pno},
	success:function(mydata){
//加载主体部分
		var data=mydata.data;
		var html="";
		for(var i=0;i<data.length;i++){
			html+=`
				<div class="copy">
					<div class="s2_pro_top">
						<a href="product_details.html?lid=${data[i].lid}" data-getId="${data[i].lid}"><img src="${data[i].msg}" alt=""></a>
					</div>
					<div class="s2_pro_bottom">
						<p class="s2_price">￥<span class="s2_price thisPrice">${data[i].price}</span></p>
						<p class="s2_details" id="${data[i].lid}">${data[i].title}</p>
						<div class="bottom_cart">
							<a href="" class="cart_change decProNub">-</a>
							<input type="text" value="1" class="nowProNub">
							<a href="" class="cart_change addProNub">+</a>
							<a href="" class="addCart">加入购物车</a>
						</div>
					</div>
				</div>
			`;
		}
		$("#addProduct").html(html);
//加载分页部分
		var html="";
		//操作重要参数pno
		var pno=parseInt(mydata.pno);
		html+=`<ul class="ulPage">`
		html+=`<li><a id="jumpXia" class="casePage" href="">下一页</a></li>`	
		if(pno<=mydata.countPno-2){
			html+=`<li><a href="">${pno+2}</a></li>`;
		}
		if(pno<=mydata.countPno-1){
			html+=`<li><a href="">${pno+1}</a></li>`;
		}
		html+=`<li><a class="clickLi" href="">${pno}</a></li>`;
		if(pno-1>0){
			html+=`<li><a href="">${pno-1}</a></li>`;
		}
		if(pno-2>0){
			html+=`<li><a href="">${pno-2}</a></li>`;	
		}
		html+=`<li><a id="jumpShang" class="casePage" href="" >上一页</a></li>`;
		html+=`</ul>`;
		$("#myPage").html(html);
		$(".ulPage").on("click","li>a:not(.casePage)",function(e){
			e.preventDefault();
			$(".ulPage>li>a").removeClass("clickLi");
			$(this).addClass("clickLi");
//			console.log($(this));
			var nowPnoOne=$(".clickLi").html();
			productLoad(nowPnoOne);
		})
		var pnoxxx=parseInt($(".clickLi").html());
//		console.log(pnoxxx);
	//上下页功能的实现
		$("#jumpShang").on("click",function(e){
			e.preventDefault();
			if(pnoxxx>1){
				productLoad(pnoxxx-1);
			}else{
				productLoad(pnoxxx);
			}
		})
		$("#jumpXia").on("click",function(e){
			e.preventDefault();
			if(pnoxxx<mydata.countPno){
				productLoad(pnoxxx+1);
			}else{
				productLoad(mydata.countPno);
			}
		});
//console.log(document.getElementById("productSs"));
	//实现点击增加或减少商品数量的事件
		$(".bottom_cart").on("click",".decProNub",function(e){
			e.preventDefault();
			var nowProNub=parseInt($(this).siblings(".nowProNub").val());
			if(nowProNub>1){nowProNub--}else{nowProNub=1}
			$(this).siblings(".nowProNub").val(nowProNub);
		});
		$(".bottom_cart").on("click",".addProNub",function(e){
			e.preventDefault();
			var nowProNub=parseInt($(this).siblings(".nowProNub").val());
			nowProNub++;
			$(this).siblings(".nowProNub").val(nowProNub);
		});




	//实现添加购物车
//		console.log($(".addCart"));
		$("a.addCart").on("click",function(e){
			e.preventDefault();
			var $this=$(this);
//			console.log($this);
			//获取商品框的参数
			var price=parseInt($this.parent().parent().find(".thisPrice").html());//获取价格
			var title=$this.parent().parent().find(".s2_details").html();//获取标题
			var nub=parseInt($this.parent().parent().find(".nowProNub").val());//获取添加前的数量
			var thisCountPrice=nub*price;
			var getThisId=parseInt($this.parent().parent().find(".s2_details").attr("id"));//获得当前商品的Id
//			console.log(price,title,nub,thisCountPrice,getThisId);
			//从购物车获取参数
			var isExit=$(".allCart").find("."+getThisId).length; //查看是否已经存在该商品
			var exitValue=parseInt($(".allCart ."+getThisId+" input").val());//查看已加商品的value值
//			console.log(isExit,exitValue);
			var html="";
			//添加操作如果存在就只修改值，不存在就添加进去。
			if(isExit==0){
				html+=`
					<div class="${getThisId}" data-proid="${getThisId}">
						<span class="cart_title" title="${title}">${title}</span>
						<div class="doChange">
							<span class="cartNub_dec">-</span>
							<input class="carNub" type="text" value="${nub}">
							<span class="cartNub_add">+</span>
						</div>
						￥<span class="thisCount">${thisCountPrice}</span>
					</div>
				`;
			}else{
				$(`.allCart .${getThisId} input`).val(`${nub+exitValue}`);
				$(`.allCart .${getThisId} .thisCount`).html(`${(nub+exitValue)*price}`);
			}
			$(".nowCart").append(html);
//			console.log($(".cartNub_dec"));
	
//		console.log($(".cartNub_dec"));
		});

//////在购物车的部分做加减操作（以这里为分界线，以前的是产品添加，这里是购物车添加）
			$("#allCart").on("click",".cartNub_dec",function(){
				var carNub=parseInt($(this).siblings(".carNub").val());//商品数量
				var thisAllCount=parseInt($(this).parent().siblings(".thisCount").html());//商品总价格
				var thisProPrice=thisAllCount/carNub;		//商品单价
				if(carNub>1){carNub-=1}else{carNub=1}
				$(this).siblings(".carNub").val(carNub);
				$(this).parent().siblings(".thisCount").html(carNub*thisProPrice);
			});
			$("#allCart").on("click",".cartNub_add",function(){
				var carNub=parseInt($(this).siblings(".carNub").val());
				var thisAllCount=parseInt($(this).parent().siblings(".thisCount").html());
				var thisProPrice=thisAllCount/carNub;
				carNub++;
				$(this).siblings(".carNub").val(carNub);
				$(this).parent().siblings(".thisCount").html(carNub*thisProPrice);
			});



//		console.log($(".goBuy"));
//通过点击.goBuy去实现点击跳转事件
		$(".goBuy").on("click",function(e){
			e.preventDefault();
			//只有登录才能去结算页面
			$.ajax({
				type:"GET",
				url:"data/denglu_2.php",
				success:function(data){
					if(data.code>0){
			//			console.log($(".nowCart>div").length);
						for(var i=0;i<$(".nowCart>div").length;i++){
			//			console.log($(".nowCart>div")[i]);
							var getForElem=$(".nowCart>div")[i];//获取当前元素
							var proid=getForElem.getAttribute("data-proid");	//获取商品id
							var count=parseInt(getForElem.querySelector("input").value);	//获取商品的数量
							var allCount=parseInt(getForElem.querySelector(".thisCount").textContent);	//获取商品总价
							var thisPrice=allCount/count;		//获取商品单价
//							console.log("id:"+proid,"数量："+count,"总价："+allCount,"单价："+thisPrice);
							//登录成功的话就往数据库里面加内容
							$.ajax({
								type:"POST",
								async:false,
								url:"data/product_cartadd.php",
								data:{pid:proid,price:thisPrice,count:count},
								success:function(){
								},
								error:function(){}
							});
						}
					//在数据添加完毕后才跳转到结算页面，结算的话是从数据库取数据反映到页面上的
					location.href="goBuy.html";
					}else{
						alert("请先登录");
					}
				},
				error:function(){alert("网络连接错误")}
			});

		});
	},
	error:function(){alert("网络故障，请检查QAQ")}
})
}
productLoad(1);
//监听滚动，使购物车悬浮
window.addEventListener("scroll",()=>{
	//	console.log(document.querySelector("#header"));
	var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
	if(scrollTop>=400)
		document.querySelector("#cartFlo").className="s2_right_bottom cartFlo";
	else
		document.querySelector("#cartFlo").className="s2_right_bottom";
})


