<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	 <!-- ▣ ajax에 스프링 시큐리티 csrf 토큰 적용하기 ( 검색 키워드 : ▣ )-->
		 <!-- ▣ 1. <head>태그 사이에 아래 <meta> 태그 두 줄 추가 -->
		 <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	 	 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	
		<!-- ★ 부트스트랩 1. css 복붙 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- ★ 부트스트랩 2. 번들 복붙 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<style>
		/* 상단 네비바 */
			
			.social-part .fa{
		    	padding-right:20px;
			}
			
			ul li a{
		    	margin-right: 20px;
			}
			.header{
				height:80px;
				width:100%;
			}
			
		#chartdiv {
		  width: 100%;
		  height: 500px;
		}
		
		.btnList{
			 text-align: center;
		}
		#crsBtn1, #crsBtn2, #crsBtn3{
			color : #dcdcdc;
			padding: 0;
			height : 10px;
			width : 20px;				
		}

			
			
	</style>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ■ jqueryCDN 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script> -->
	
	<!-- ■ 상단 네비바 : 네비바 적용3) -->
	<div class="header">
	    <nav class="navbar navbar-expand-sm   navbar-light bg-light">
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	
        	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
		          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			            <li class="nav-item">
			            	<a class="nav-link" href="/"> 홈 <span class="sr-only"></span></a>
			            </li>
			           
			            <li class="nav-item dropdown dmenu">
			           		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			              		소설 선택
			            	</a>
			            	<div class="dropdown-menu sm-menu">
			              		<a class="dropdown-item" href="/free/novelList">무료소설</a>
			              		<a class="dropdown-item" href="/paid/novelList">유료소설</a>
			              	</div>
			          	</li>
			          <li class="nav-item">
				            <a class="nav-link" href="/enroll/list">작품 신청 게시판</a>
			          </li>
			          <li class="nav-item">
				            <a class="nav-link" href="/tourna/list2">토너먼트</a>
			          </li>
			           <li class="nav-item">
			              	<a class="nav-link" href="http://localhost:8181/charge/${user.user_num}">결제</a>
		               </li>
		                <li class="nav-item">
			              	<a class="nav-link" href="http://localhost:8181/bestseller/list">베스트 셀러</a>
		               </li>
		          </ul><!-- ul 태그 끝 -->
		          
	        </div><!-- div 끝 -->
	    </nav><!-- 네비바 끝 -->
     </div><!-- header 끝 --> 	
     
     
   	<!-- HTML -->
   	<div class="container">
   		<h1>카테고리 별 평균 별점</h1><br/>
		<div id="chartdiv"></div>
		
		<br/><hr/><br/>
		<h2>샘플 데이터</h2>
		<div>
			<table class="table">
				<!-- style="display:none;"> -->
				<thead class="table-dark">
					<tr>
						<th>Item ID</th>
						<th>Title</th>
						<th>Author</th>
						<th>Category</th>
						<th>PubDate</th>
						<th>Publisher</th>
						<th>Customer Review Rank</th>
						<th>Category Rank</th>
					</tr>
				</thead>
				<tbody id="sampleDataList">
					<!-- 리스트가 들어갈 위치 -->
				</tbody>
			</table>
			<br/><br/><br/><br/><br/>
		</div>
		
	</div>


	
	<!-- Resources -->
	<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
	
	<!-- Chart code -->
	<script>
	
		<!-- ▣ 2. <script> 태그에서 변수로 받아준다. -->
		// ● csrf 토큰
		let token = $("meta[name='_csrf']").attr("content");
			let header = $("meta[name='_csrf_header']").attr("content");
		
		// ■ 변수 설정
		let data;
		let test_data = "[";
	
		
		// ■ 함수 실행
		getRankByCategory();
		
		
		// ■ 카테고리별 소비자 별점 가져오기
		function getRankByCategory(){
			
			$.getJSON("/bestsellerAjax/rank", function (data){
				
				//console.log(data);
				console.log(data[0].category_id);
				console.log(data[0].rank_by_category);
				
				
				
				$(data).each(function(){
					
					if(this.rank_by_category > 0){
					
						test_data += "{category: '" + this.category_id  + "'," +
								   	 "value: " + this.rank_by_category + "},"
					}		   	 
					
				});// end .each
				
				
				test_data += "]";
				
				console.log(test_data);
				
			
			//showAmChart();
			
			
			// test
			
			test_data = [{category: '101',value: 8.63},{category: '102',value: 7.39},{category: '103',value: 4.2},{category: '104',value: 4.78},{category: '105',value: 7.31},{category: '107',value: 1.82},{category: '108',value: 2.6},{category: '109',value: 8.4},{category: '110',value: 6.96},{category: '111',value: 6.5},{category: '112',value: 7.74},{category: '113',value: 3.64},{category: '114',value: 4.61},{category: '115',value: 8.32},{category: '116',value: 6.12},{category: '117',value: 7.84},{category: '118',value: 8.41},{category: '119',value: 7.73},{category: '120',value: 4.55},{category: '121',value: 8.32},{category: '122',value: 5.57},{category: '123',value: 3.88},{category: '124',value: 3.78},{category: '125',value: 4.67},{category: '126',value: 7.04},{category: '128',value: 6.4},{category: '129',value: 3.63},{category: '201',value: 4.4},{category: '203',value: 4.68},{category: '205',value: 4.98},{category: '206',value: 5.06},{category: '207',value: 1},{category: '210',value: 0.33},{category: '215',value: 2.57},{category: '301',value: 0.33},{category: '302',value: 1.11},{category: '304',value: 2},{category: '307',value: 1.5},{category: '310',value: 1.38},{category: '314',value: 0.33},{category: '315',value: 1.36},{category: '318',value: 0.27},{category: '425',value: 0.36},];
			
			
				console.log("showAmChart 시작");
				// Create root element
				// https://www.amcharts.com/docs/v5/getting-started/#Root_element
				var root = am5.Root.new("chartdiv");
				
				
				// Set themes
				// https://www.amcharts.com/docs/v5/concepts/themes/
				root.setThemes([
				  am5themes_Animated.new(root)
				]);
				
				
				// Create chart
				// https://www.amcharts.com/docs/v5/charts/xy-chart/
				var chart = root.container.children.push(am5xy.XYChart.new(root, {
				  panX: true,
				  panY: true,
				  wheelX: "panX",
				  wheelY: "zoomX",
				  pinchZoomX:true
				}));
				
				// Add cursor
				// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
				var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
				cursor.lineY.set("visible", false);
				
				
				// Create axes
				// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
				var xRenderer = am5xy.AxisRendererX.new(root, { minGridDistance: 0 });
				xRenderer.labels.template.setAll({
				  rotation: -90,
				  centerY: am5.p50,
				  centerX: am5.p100,
				  paddingRight: 15
				});
				
				var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
				  maxDeviation: 0.3,
				  //maxDeviation: 10.0,
				  categoryField: "category",
				  renderer: xRenderer,
				  tooltip: am5.Tooltip.new(root, {})
				}));
				
				var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
				  maxDeviation: 0.3,
				  //maxDeviation: 10.0,
				  
				  renderer: am5xy.AxisRendererY.new(root, {})
				}));
				
				
				// Create series
				// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
				var series = chart.series.push(am5xy.ColumnSeries.new(root, {
				  name: "Series 1",
				  xAxis: xAxis,
				  yAxis: yAxis,
				  valueYField: "value",
				  sequencedInterpolation: true,
				  categoryXField: "category",
				  tooltip: am5.Tooltip.new(root, {
				    labelText:"{valueY}"
				  })
				}));
				
				series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5 });
				series.columns.template.adapters.add("fill", function(fill, target) {
				  return chart.get("colors").getIndex(series.columns.indexOf(target));
				});
				
				series.columns.template.adapters.add("stroke", function(stroke, target) {
				  return chart.get("colors").getIndex(series.columns.indexOf(target));
				});
				
						
			
				
				
				//xAxis.data.setAll(data);
				//series.data.setAll(data);
				
				console.log("▼");
				console.log(test_data);
				xAxis.data.setAll(test_data);
				series.data.setAll(test_data);
				
				
				// Make stuff animate on load
				// https://www.amcharts.com/docs/v5/concepts/animations/
				series.appear(1000);
				chart.appear(1000, 100);
			
			
			
			})// end getJSON
			
			
	
		}// end getRankByCategory()
		
		
		
		
		$.getJSON("/bestsellerAjax/sampleData", function(data){
			
			console.log("▼ 샘플 데이터 10개")
			console.log(data);
			
			let str = "";
			
			$(data).each(function(){
				
				pub_date = new Date(this.pub_date)
				
				str += "<tr>"
							+ "<td>" + this.item_id + "</td>"
							+ "<td>" + this.title + "</td>"
							+ "<td>" + this.author + "</td>"
							+ "<td>" + this.category_id + "</td>"
							+ "<td>" + pub_date + "</td>"
							+ "<td>" + this.publisher + "</td>"
							+ "<td>" + this.customer_review_rank + "</td>"
							+ "<td>" + this.rank_num + "</td>"
					+ "</tr>";
				
			})// end .each
			
			$("#sampleDataList").html(str);
			
			
			
			
		})// end getJSON
		
		
	</script>
	


</body>
</html>