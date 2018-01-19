//轮播
(()=>{
var $banner=$("#banner");
$("#banner_ul>li:first").addClass("hover");
//console.log($banner);
var i=0,timer=null;
function move(){
	timer=setTimeout(()=>{
		if(i<4){
			i++;
			$banner.css("left",-1200*i);
			if(i<4){
				$("#banner_ul>li:eq("+i+")").addClass("hover").siblings().removeClass("hover");
			}else{
				$("#banner_ul>li:eq("+0+")").addClass("hover").siblings().removeClass("hover");
			}
			move();
		}else{
			$banner.css("transition","");
			$banner.css("left",0);
			setTimeout(()=>{
				$banner.css("transition","all .3s linear");
				i=1;
				$banner.css("left",-1200*i);
				$("#banner_ul>li:eq("+i+")").addClass("hover").siblings().removeClass("hover");
			},50);
			$("#banner_ul>li:eq("+i+")").addClass("hover").siblings().removeClass("hover");
			move();
		}
	},3000);
	var leftNow=parseInt($banner.css("left"));
	}
	move();
/*	$("#arrow_left").click(()=>{
		clearTimeout(timer);
		$banner.css("left",leftNow-1200);
		move();
	});
*/
	$("#banner").hover(
		()=>clearTimeout(timer),
		()=>move()
	);
	$("#banner_ul").on("mouseover","li",function(){
		var $this=$(this);
		if(!$this.hasClass("hover")){
			i=$this.index();
			$banner.css("left",-1200*i);
//			console.log($("#banner_ul>li:eq("+i+")"));
			$("#banner_ul>li:eq("+i+")").addClass("hover").siblings().removeClass("hover");
		}
	});
})();

//楼层效果

function getTotalTop(elem){   //某元素到顶部的距离
	var sum=0;
	do{
		sum+=elem.offsetTop;
		elem=elem.offsetParent;
	}while(elem);
	return sum;
}
//滚动事件亮灯
var f1TotalTop=getTotalTop(document.getElementById("f1"));
var lift=document.getElementById("lift");
//console.log(lift);
//console.log($(".lift_list li:nth-child(1)"));
//console.log(lift.querySelector("li:nth-child(1)"));
window.addEventListener("scroll",()=>{
	//判断lift何时显示，何时隐藏
	var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
	lift.style.display=scrollTop>f1TotalTop-innerHeight/2?"block":"none";
	if(lift.style.display=="block"){
		var fs=document.querySelectorAll(".floor");
		var fEnd=document.querySelectorAll(".f_end");
		for(var i=0;i<fs.length;i++){
		//获得当前楼层距离body顶部的距离
		var totalTop=getTotalTop(fs[i]);
		//获得当前楼层高度
		var xxx=getTotalTop(fEnd[i])-totalTop;
		//灯亮开始的高度
		var start=totalTop-innerHeight/2;
		//当前等熄灭的位置
		var end=start+xxx;
//		console.log(start,xxx,end);
//		console.log(xxx);
		if(scrollTop>=start&&scrollTop<end)
			break;
		}
		var currLi=lift.querySelector(".lift_item_on");
//		console.log(currLi);
//		console.log(i);
		if(currLi)
			currLi.className="lift_item";
		lift.querySelector(`li:nth-child(${i+1})`).className="lift_item_on";
		//由于轮播太低，当滚动距离小于10px时让左侧楼灯消失
//		console.log(scrollTop);
//		if(scrollTop<240){lift.style.display=="none"}
	}
	//为楼层的灯绑定事件
	var as=lift.querySelectorAll(".lift_list>li>a");
//	console.log(as);
	for(let i=0;i<as.length;i++){
		as[i].onclick=function(e){
			e.preventDefault();
			var fi=document.getElementById("f"+(i+1));
			var totalTop=getTotalTop(fi);
//			console.log(fi,totalTop);
//			window.scrollTo(0,totalTop-200);
			$("html,body").stop(true).animate({scrollTop:totalTop-200},500);
		}
	}
});


