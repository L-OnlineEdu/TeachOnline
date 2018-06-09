<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>学生答题结果</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/lianxi.css">
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
	<script src="jxv4.js"></script>
</head>
<body>
<input type="hidden" id="subFlag" value="showResult">
<div id="aa1"></div>
<div class="container" onclick="refresh()" style="margin-top: 100px;">
<div class="row">
	<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
		<div class="up_downs">
			<div class="left_up_downs pull-left">
				<p>100%</p>
				<p>80%</p>
				<p>60%</p>
				<p>40%</p>
				<p>20%</p>
				<p>0%</p>　
			</div>
			<div class="right_up_downs pull-left">
				<div class="right_up_downs_top">
					<!--背景线-->
					<ul class="list-unstyled right_top_ul">
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<!--柱形-->
					<div class="right_pillar">
						<ul class="list-unstyled right_pillar_ul">
							<li>
								<div class="right_pillar_for">
									<div class="right_pillar_fill right_pillar_color1" id="pillar_content1"
										 data-toggle="tooltip" data-placement="auto"
										 title="<p class='numA'>选项【A】</p>">
										<div class="right_pillar_bg_1" style="height: 0%"></div>
									</div>
								</div>
							</li>
							<li>
								<div class="right_pillar_for">
									<div class="right_pillar_fill right_pillar_color4" id="pillar_content4"
										 data-toggle="tooltip" data-placement="auto"
										 title="<p class='numB'>选项【B】</p>">
										<div class="right_pillar_bg_4" style="height: 0%"></div>
									</div>
								</div>
							</li>
							<li>
								<div class="right_pillar_for">
									<div class="right_pillar_fill  right_pillar_color6" id="pillar_content6"
										 data-toggle="tooltip" data-placement="auto"
										 title="<p class='numC'>选项【C】</p>">
										<div class="right_pillar_bg_6" style="height: 0%"></div>
									</div>
								</div>
							</li>
							<li>
								<div class="right_pillar_for">
									<div class="right_pillar_fill right_pillar_color8" id="pillar_content8"
										 data-toggle="tooltip" data-placement="auto"
										 title="<p class='numD'>选项【D】</p>">
										<div class="right_pillar_bg_8" style="height: 0%"></div>
									</div>
								</div>
							</li>
							<li>
								<div class="right_pillar_for">
									<div class="right_pillar_fill right_pillar_color9" id="pillar_content9"
										 data-toggle="tooltip" data-placement="auto"
										 title="<p class='numN'>未作答</p>">
										<div class="right_pillar_bg_10" style="height: 100%;background-color: gainsboro"></div>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>
				<div class="right_up_downs_bottom clearfix">
					<div class="pull-left text-center">【A】</div>
					<div class="pull-left text-center">【B】</div>
					<div class="pull-left text-center">【C】</div>
					<div class="pull-left text-center">【D】</div>
					<div class="pull-left text-center">【未作答】</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script>
	function refresh() {
		window.location.reload()
    }

$(function () {
	myTooltip('#pillar_content1');
	myTooltip('#pillar_content2');
	myTooltip('#pillar_content3');
	myTooltip('#pillar_content4');
	myTooltip('#pillar_content5');
	myTooltip('#pillar_content6');
	myTooltip('#pillar_content7');
	myTooltip('#pillar_content8');
	myTooltip('#pillar_content9');
	myTooltip('#pillar_content10');
});
function myTooltip(id) {
	$('[data-toggle="tooltip"]').tooltip({html: true});

	$(id).on('show.bs.tooltip', function () {
		var bg = $(id).find("div").css("background-color");
//              alert(bg);
		setTimeout(function () {  //alert(0);
			$(".tooltip.top .tooltip-arrow").css({'border-top-color': bg});
			$(".tooltip.bottom .tooltip-arrow").css({'border-bottom-color': bg});
			$(".tooltip.left .tooltip-arrow").css({'border-left-color': bg});
			$(".tooltip.right .tooltip-arrow").css({'border-right-color': bg});
			$(".tooltip-inner").css({
				'background': "#fff",
				'color':"#333",
				"border":"1px",
				"border-style":'solid',
				"border-color":bg,
				"padding":"10px",
				"box-sizing":"border-box",
				"font-size":"16px"
			});
		}, 10);
	})
}
$(function () {
	$(".right_pillar_for").each(function (index) {
		var len=$(".right_pillar_for").eq(index).children().length;
		console.log(len);
		if (len==1){
			$(".right_pillar_for").eq(index).find(".right_pillar_fill").addClass("right_pillar_dan");
		}else {
			$(".right_pillar_for").eq(index).find(".right_pillar_fill").removeClass("right_pillar_dan");
		}
	})
})
</script>

<script>
    window.addEventListener('beforeunload', function(event) {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/tea/exitQues" ,//url
            data: {},
            success: function (result) {

            }
        });
    });
</script>


<div style="text-align:center;clear:both">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
</body>
</html>
