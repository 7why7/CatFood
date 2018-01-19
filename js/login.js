//页面加载时判断session，加载相应数据
		$.ajax({
			type:"GET",
			url:"data/denglu_2.php",
			success:function(data){
				console.log(data);
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
					location.replace("../zuce/index.html");
				});
				//登录点击事件
				$("#denglu").on("click",function(e){
					e.preventDefault();
					console.log($("#denglu"));
					location.replace("denglu_1.html");
				});
				//注销点击事件
				$("#zhuxiao").click(function(e){
					e.preventDefault();
					$.ajax({
						type:"GET",
						url:"dengluOut.php",
						success:function(){
							alert("注销成功");
		//					history.go(0);
							location.reload();
						},
						error:function(){alert("网络故障，请检查")}
					});
				});
			},
			error:function(){alert("网络连接错误")}
		});