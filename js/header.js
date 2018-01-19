(()=>{
$("#header").load("header.html",()=>{
//页面加载时判断session，加载相应数据
	$.ajax({
		type:"GET",
		url:"data/denglu_2.php",
		success:function(data){
//			console.log(data);
//			console.log("denglu_2.php is ok");
			html="";
			if(data.code<=0){
				html+=`
				<span id="zhuce"><a href="">注册</a></span>
				<span>|</span>
				<span id="denglu"><a href="">登录</a></span>
				`;
			}else if(data.code>0){
				html+=`
				<span id="dengluOk">欢迎登录,${data.uname}</span>
				<span>|</span>
				<span><a href="" id="zhuxiao">注销</a></span>
				`;
			}
			$("#login").html(html);
			//注册点击事件
			$("#zhuce").on("click",function(e){
				e.preventDefault();
				location="zhuce.html";
			});
			//登录点击事件
			$("#denglu").on("click",function(e){
				e.preventDefault();
//				console.log($("#denglu"));
				location="denglu_1.html";
			});
			//注销点击事件
			$("#zhuxiao").click(function(e){
				e.preventDefault();
				$.ajax({
					type:"GET",
					url:"data/dengluOut.php",
					success:function(){
						alert("注销成功");
		//					history.go(0);
						location.reload();
					},
					error:function(){alert("网络故障，请检查");}
				});
			});
//			console.log($("#productSs"));
			$("#productSsClick").on("click",function(e){
				e.preventDefault();
//				console.log(1);
				var kw=$("#productSs").val();
//				console.log(kw);
//				kw=kw.charCodeAt();
//				console.log(kw);
				location.href='product.html?kw='+kw;
			});
		},
		error:function(){alert("网络连接错误")}
	});

	//头部监视器
	window.addEventListener("scroll",()=>{
	//	console.log(document.querySelector("#header"));
		var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
		if(scrollTop>=80)
			document.querySelector("#header").className="clear fixed_nav";
		else
			document.querySelector("#header").className="clear";
	})

})
})()