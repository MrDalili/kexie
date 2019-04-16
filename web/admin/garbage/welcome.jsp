<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Purple Admin</title>
		<!-- plugins:css -->
		<link rel="stylesheet" href="../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
		<link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
		<!-- endinject -->
		<!-- inject:css -->
		<link rel="stylesheet" href="../css/style.css">
		<!-- endinject -->
		<link rel="shortcut icon" href="../images/favicon.png" />
</head>

<body>

<h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-home"></i>
              </span>
	欢迎使用自助报名系统后台
</h3>
<div class="row" >
	<div class="col-md-4 stretch-card grid-margin">
		<div class="card bg-gradient-danger card-img-holder text-white">
			<div class="card-body">
				<img src="../images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
				<h4 class="font-weight-normal mb-3">您已发布的活动数
					<i class="mdi mdi-chart-line mdi-24px float-right"></i>
				</h4>
				<h2 class="mb-5">${user.competitionNum}个</h2>
				<%--<h6 class="card-text">Increased by 60%</h6>--%>
			</div>
		</div>
	</div>
	<div class="col-md-4 stretch-card grid-margin">
		<div class="card bg-gradient-info card-img-holder text-white">
			<div class="card-body">
				<img src="../images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
				<h4 class="font-weight-normal mb-3">共计报名人数
					<i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
				</h4>
				<h2 class="mb-5">${user.singUpNum}人</h2>
				<%--<h6 class="card-text">Decreased by 10%</h6>--%>
			</div>
		</div>
	</div>
	<div class="col-md-4 stretch-card grid-margin">
		<div class="card bg-gradient-success card-img-holder text-white">
			<div class="card-body">
				<img src="../images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
				<h4 class="font-weight-normal mb-3">Visitors Online
					<i class="mdi mdi-diamond mdi-24px float-right"></i>
				</h4>
				<h2 class="mb-5">95,5741</h2>
				<h6 class="card-text">Increased by 5%</h6>
			</div>
		</div>
	</div>
</div>

</body>

</html>