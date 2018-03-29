<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<base href="<?php echo site_url()?>">
	<style>
		#student{
			height: 30px;
			width: 100px;
			background: #ccc;
			float: right;
			display: none;
		}
	</style>
</head>
<body>
	<select name="" id="item1">
		<option value="">政治思想评价子项目</option>
	</select>
	<select name="" id="item2">
		<option value="">价值观</option>
	</select>
	<select name="" id="item3">
		<option value="">参加积极分子党课并结业</option>
	</select>
	<div id="student"></div>
	<script src="assets/js/jquery-1.11.3.min.js"></script>
	<script>
	function getItem1(pid){
		$.post('User/getItem',{'pid':pid},function(data){
			var str = '';
			for(var i=0;i<data.length;i++){
			 	str += '<option value='+data[i].id+'>'+data[i].name+'</option>';
			}
			$('#item1').html(str);

        },'json');
	}
	function getItem2(pid){
		$.post('User/getItem',{'pid':pid},function(data){
			var str = '';
			for(var i=0;i<data.length;i++){
			 	str += '<option value='+data[i].id+' pid='+data[i].pid+'>'+data[i].name+'</option>';
			}
			$('#item2').html(str);

        },'json');
	}
	function getItem3(pid){
		$.post('User/getItem',{'pid':pid},function(data){
			var str = '';
			for(var i=0;i<data.length;i++){
			 	str += '<option value='+data[i].id+' pid='+data[i].pid+'>'+data[i].name+'</option>';
			}
			$('#item3').html(str);

        },'json');
	}
	getItem1(0);
	getItem2(1);
	getItem3(4);


	$('#item1').change(function(){
		getItem2($(this).val());
		getItem3($('#item2').val());
	});
	$('#item2').change(function(){
		getItem3($(this).val());
	});
	$('#item3 option').on('click',function(){
		$('#student').show();
	});

		
	</script>
</body>
</html>