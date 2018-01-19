//console.log("测试js是否起作用");
$.ajax({
	type:"GET",
	url:"data/goBuy.php",
	success:function(data){
		var html="";
		for(var i=0;i<data.length;i++){
			html+=`
				<ul class="se2_topul">
					<li class="allCheck"><input type="checkbox"></li>
					<li class="proMsg"><div>${data[i].title}</div></li>
					<li class="price">${data[i].price}</li>
					<li class="count">
						<a class="pro_dec doChange">-</a>
						<input value=${data[i].count}>
						<a class="doChange pro_add">+</a>
					</li>
					<li class="priceCount">${data[i].price*data[i].count}</li>
					<li class="caozuo"><a class="delPro" data-getid=${data[i].pid}>删除</a></li>
				</ul>	
			`;
		}
		$(".getProDetl").html(html);
		//删除商品
		$(".delPro").on("click",function(e){
			e.preventDefault();
			$this=$(this);
			var thisPid=$this.attr("data-getId");//获取商品id
			var thisParentElem=$this.parent().parent();
			$.ajax({
				type:"post",
				url:"data/delProduct.php",
				data:{pid:thisPid},
				success:function(data){
					if(data.code>0){
						thisParentElem.hide();
//						alert("删除成功");
					}else if(data.code<0){
						alert("删除失败");
					}
				},
				error:function(){
					alert("网络连接错误");
				}
			});
		})
		//按钮加减商品数量
		$(".se2_topul").on("click",".doChange",function(e){
			e.preventDefault();
			var $this=$(this);
			var liPrice=parseInt($this.parent().siblings(".price").html());//当前商品单价
			var liNowCount=parseInt($this.siblings("input").val());	//当前商品数量
			//给商品数量做加减
			if($this.hasClass("pro_dec")){
				if(liNowCount>1){
					liNowCount--;
				}else{
					liNowCount=1;
				}
			}else{
				liNowCount++;
			}
			//把加减后的值和新总价给页面
			$this.siblings("input").val(liNowCount);
			$this.parent().siblings(".priceCount").html(liNowCount*liPrice);
			//如果该元素被选中就调用函数
			if($this.parent().siblings(".allCheck").children("input").is(":checked")){
				goCheckAll();
			}
		});
		//定义一个方法，计算总价钱和总价
		function goCheckAll(){
			var allCheckLi=$(".myCheckLi");
			var sumOne=0;
			var sumTwo=0;
			console.log(allCheckLi);
			$.each(allCheckLi,function(index,elem){
				sumOne+=parseInt($(elem).siblings(".count").children("input").val());
				sumTwo+=Number($(elem).siblings(".priceCount").html());
			});
			//console.log(sumOne,sumTwo);
			$(".jiesuan_count").html(sumOne);
			$(".all_price_count>span").html(sumTwo);
		}
		//绑定单选框的单击事件
		$(".se2_topul").on("click",".allCheck>input",function(){
			var $this=$(this);
			var liNowCount=parseInt($this.parent().siblings(".count").children("input").val());	//当前商品数量
			var liPriceCount=Number($this.parent().siblings(".priceCount").html());		//找当前商品的总价
//			console.log(liNowCount,liPriceCount);
			//如果被选中就去修改值
			if($this.is(":checked")){
				$this.parent().addClass("myCheckLi");
			}else{
				$this.parent().removeClass("myCheckLi");
			}
			goCheckAll();
		})
//		location.reload();
		$("#payDelAll").on("click",function(e){
			e.preventDefault();
			$.ajax({
				type:"GET",
				url:"data/del_cart.php",
				success:function(data){
					if(data.code==200){
						alert("支付成功");
						location.reload();
					}else{
						alert("支付失败");
					}
				},
				error:function(){alert("网络连接错误，请检查")}
			})
		})
	},
	error:function(){alert("网络连接错误，请检查")}
});





