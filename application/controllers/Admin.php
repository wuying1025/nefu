<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Admin extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_model');
		$this->load->model('Class_model');
		$this->load->model('College_model');
		$this->load->model('Student_model');
		$this->load->model('Items_model');
		$this->load->model('log_model');
		$this->load->model('Prize_confirm_model');
		$this->load->model('Prize_get_model');
		$this->load->model('Deyu_model');
		$this->load->model('Wenti_model');
		$this->load->helper('Log');
		header("Access-Control-Allow-Origin: * "); 
	}

	//添加班级
	public function add_class(){
		$name = $this->input->get('name');
		$cid = $this->input->get('c_id');
		$pid = $this->input->get('p_id');
		$grade = $this->input->get('grade');
		$data= array(
			'class_name'=>$name,'p_id'=>$pid,
			'grade'=>$grade,'c_id'=>$cid
			);
		$result = $this->Class_model->add_class($data);
		if($result){
			echo 'success';
		}else{	
			echo 'fail';
		}
	}
	
	//添加学院
	public function add_college(){
			$name = $this->input->get('name');
			$data = array(
				'name'=>$name,'pid'=>0
				);
			$result = $this->College_model->add_college($data);
			if($result){
				echo 'success';
			}else{	
				echo 'fail';
			}
	}
	//添加专业
	public function add_profession(){
		$name = $this->input->get('name');
		$pid = $this->input->get('pid');
		$data = array(
			'name'=>$name,'pid'=>$pid
			);
		$result = $this->College_model->add_college($data);
		if($result){
			echo 'success';
		}else{	
			echo 'fail';
		}
	}
	//查询所有管理员
	public function get_all_admin(){
		$result = $this->Admin_model->get_all_admin();
		echo  json_encode($result);
	}
	//添加管理员
	public function add_admin(){
		$college = $this->input->get('college');
		$psd = $this->input->get('psd');
		$account = $this->input->get('account');
		$name = $this->input->get('name');
		$grade = $this->input->get('grade');
		$data = array(
			'college'=>$college,'password'=>md5($psd),
			'a_account'=>$account,'name'=>$name,'grade'=>$grade,
			);
		$result = $this->Admin_model->add_admin($data);
		if($result){
			echo 'success';
		}else{	
			echo 'fail';
		}
	}
	//添加学生
	public function add_student(){
		$num  = $this->input->get('num');
		$name = $this->input->get('name');
		$psd = $this->input->get('psd');
		$cid = $this->input->get('cid');
		$grade = $this->input->get('grade');
		$college_id = $this->input->get('college_id');
		$sex = $this->input->get('sex');
		$img = $sex=='男'?'http://127.0.0.1/nefu/uploads/s1.png':'http://127.0.0.1/nefu/uploads/s4.png';
		$personas_img = $sex=='男'?'http://127.0.0.1/nefu/uploads/boy.png':'http://127.0.0.1/nefu/uploads/girl.png';

		$stus = $this->Student_model->get_student_by_num($num);
		if(count($stus) > 0 ){
			echo 'has';
		}else{
			$data = array(
				's_num'=>$num,'s_name'=>$name,
				's_pass'=>md5($psd),'class_id'=>$cid,
				'grade'=>$grade,'img'=>$img,
				'college_id'=>$college_id,'sex'=>$sex,
				'personas_img'=>$personas_img
			);
			$result = $this->Student_model->add_student($data);
			if($result){
				echo 'success';
			}else{
				echo 'fail';
			}
		}
	}

	//管理员登录
	public function admin_login(){
		$num = $this->input->get('adm_num');
		$psd = $this->input->get('adm_psd');
		$data1 = array('a_account'=>$num,'password'=>md5($psd));
		$data2 = array('a_account'=>$num);
		$result1 = $this->Admin_model->admin_login($data1);
		$result2 = $this->Admin_model->admin_login($data2);
		if($result1&&$result2){
           insert_log_data($result1->a_id,'登录',1);
			echo json_encode($result1);
		}else if($result2){
			//密码错误
			echo 'error';
		}else{
			//账号错误
			echo 'fail';
		}
	}
	//添加奖项
	public function add_items(){
		$name = $this->input->get('name');
		$pid = $this->input->get('pid');
		$data = array(
			'name'=>$name,'pid'=>$pid
			);
		$result = $this->Items_model->add_items($data);
		if($result){
			echo 'success';
		}else{	
			echo 'fail';
		}
	}
	//删除三级奖项
	public function delete_items3(){
		$id = $this->input->get('itemid');
		$result = $this->Items_model->delete_items3($id);
        if($result){
			echo 'success';
		}else{	
			echo 'fail';
		}
	}
	//删除二级奖项
	public function delete_items2(){
		$id = $this->input->get('itemid');
		$result = $this->Items_model->delete_items2($id);
        if($result){
			echo 'success';
		}else{	
			echo 'fail';
		}
	}
	//删除一级奖项
	public function delete_items1(){
		$id = $this->input->get('itemid');
		$result = $this->Items_model->delete_items1($id);
		// echo json_encode($result);
        if($result){
			echo 'success';
		}else{	
			echo 'fail';
		}
	}

	//获取所有学生的操作记录
    public function get_all_stu_log(){
        $result = $this->log_model->get_all_stu_log();
        if($result){
            echo json_encode($result);
        }else{
            echo 'fail';
        }
    }
    //获取所有管理员的操作记录
    public function get_all_admin_log(){
        $result = $this->log_model->get_all_admin_log();
        if($result){
            echo json_encode($result);
        }else{
            echo 'fail';
        }
        
    }
	//根据学院和年级查找所有录入的信息
    public function get_info_by_college_grade(){
    	$college_id = $this->input->get('college_id');
    	$grade = $this->input->get('grade');
    	$result = $this->Prize_confirm_model->get_info_by_college_grade($college_id,$grade);
    	$result123 =   []; 
		foreach($result as $k){
		    $result123[$k->u_id][] = $k; 
		}
    	echo json_encode($result123);
    }
    //根据学院和年级查找已获奖项的信息
    public function get_prize_info_by_college_grade(){
    	$college_id = $this->input->get('college_id');
    	$grade = $this->input->get('grade');
    	$result = $this->Prize_get_model->get_info_by_college_grade($college_id,$grade);
    	echo json_encode($result);
    }
    //查看班级录入的信息
	public function get_class_info(){

		$class_id = $this->input->get('class_id');
		$result = $this->Prize_confirm_model->get_submit_class_info($class_id);
		$result123 =   []; 
		foreach($result as $k){
		    $result123[$k->u_id][] = $k; 
		}
		echo json_encode($result123);
	}
	//取消提交
	public function cancel_sub(){
		$class_id = $this->input->get('class_id');
 	  	$result1 = $this->Prize_confirm_model->get_submit_class_info($class_id);
		$pids = array(); 
		foreach($result1 as $res){
		    array_push($pids, $res->p_id);
		}
    	$result2 = $this->Prize_confirm_model->cancel_sub_class_info($pids);
    	if($result2){
    		echo 'success';
        }else{
            echo 'fail';
        }
	}
	//导员确定录入奖项-存入已获奖项表
	public function gain_info(){
		$class_id = $this->input->get('class_id');
		$info = $this->Prize_confirm_model->get_submit_class_info($class_id);
		$data = array();
		$pids = array();
		foreach($info as $res){
			$arr = array(
				'u_id'=>$res->u_id,
				'u_name'=>$res->u_name,
				'i_id'=>$res->i_id,
				'i_name'=>$res->i_name,
				'get_time'=>$res->add_time
			);
			array_push($data,$arr);
			array_push($pids,$res->p_id);
		}
		$result1 = $this->Prize_get_model->add_prize($data);
		$result2 = $this->Prize_confirm_model->delete_class_info($pids);
		if($result1 && $result2){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//设定班长
	public function set_monitor(){
		$s_id = $this->input->get('s_id');
		$result = $this->Student_model->set_monitor($s_id);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//取消班长
	public function cancel_monitor(){
		$s_id = $this->input->get('s_id');
		$result = $this->Student_model->cancel_monitor($s_id);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//替换班长
	public function exChange_monitor(){
		$new_id = $this->input->get('new_id');
		$old_id = $this->input->get('old_id');
		$result = $this->Student_model->exChange_monitor($new_id,$old_id);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}

	//检查旧密码
    public function check_pwd()
    {
        $a_id = $this->input->get('a_id');
        $pwd = $this->input->get('pwd');
        $pwd = md5($pwd);
        $result = $this->Admin_model->get_by_id_pwd($a_id,$pwd);
        if($result){
            echo 'success';
        }else{
            echo 'fail';
        }
    }
    //修改密码
    public function update_password()
    {
        $a_id = $this->input->post('a_id');
        $pwd = $this->input->post('pwd');
        $pwd = md5($pwd);
        $result = $this->Admin_model->update_pwd($a_id,$pwd);
        if($result){
            echo 'success';
        }else{
            echo 'fail';
        }
    }
    //重置密码
    public function reset()
    {
        $a_id = $this->input->get('a_id');
        $newpwd = $this->input->get('newpwd');
        $pwd = md5($newpwd);
        $result = $this->Admin_model->update_pwd($a_id,$pwd);
        if($result){
            echo 'success';
        }else{
            echo 'fail';
        }
    }
    //搜索
    public function search(){
        $what = $this->input->get('what');
        $way = $this->input->get('way');
        $result = $this->Student_model->get_stu($what,$way);
        if($result){
            echo json_encode($result);
        }else{
            echo 'fail';
        }
	}
	//考评更改学生德育加分
	public function reset_add_deyu(){ 
		$data = array();
		$pim=$this->input->get('pim');
		
		foreach($pim as $rs){				
			$item=json_decode($rs);
			$arr1 = array(			//更新的内容	
				'd_cfm'=>$item->check,
				'd_sta'=>2,
				'd_who'=>$item->person,
			);
			$arr2=array(  //where条件
				's_num'=>$item->s_num,
				'get_term'=>$item->get_term,
				'month'=>$item->month,
				'd_num'=>$item->index,
				'd_tag'=>$item->d_tag,
			);
			// var_dump($arr1); var_dump($arr2);
			$update = $this->Deyu_model->upd_deyu($arr1,$arr2);
		
		}
		if($update){
			echo "success";    
		}else{
			echo "fail";
		}
	}
	//考评更改学生德育减分
	public function reset_short_deyu(){ 
		$data = array();
		$pim=$this->input->get('pim');
		foreach($pim as $rs){				
			$item=json_decode($rs);
			$arr1 = array(				
				'd_cfm'=>$item->check,			
				'd_sta'=>2,
				'd_who'=>$item->person,
			);
			$arr2=array(
				's_num'=>$item->s_num,
				'get_term'=>$item->get_term,
				'month'=>$item->month,
				'd_num'=>$item->index,
				'd_tag'=>$item->d_tag,
			);
			$update = $this->Deyu_model->upd_short_deyu($arr1,$arr2);
			
		}
		if($update){
			echo "success";    
		}else{
			echo "fail";
		}
	}
	//考评更改文体
	public function reset_wenti(){ //pim
		$data = array();
		$pim=$this->input->get('pim');

		foreach($pim as $rs){				
			$item=json_decode($rs);
			$arr1=array(
				'w_cfm'=>$item->w_cfm,
				'w_sta'=>2,
				'w_who'=>$item->w_who,				
			);
			$w_id=$item->imi;
			$upd=$this->Wenti_model->upd_wenti($arr1,$w_id);	
		}
		if($upd){
			echo "success";
		}else{
			echo "fail";
		}
	}
 	//辅导员和考评查看德育成绩  根据class_id 和 get_term 
	public function adm_get_deyu(){
		 $class_id=$this->input->get('class_id');//31;
		$term =$this->input->get('get_term'); //"2018年春季";
		$sub_term = substr($term,7);
		$month =$this->input->get('month'); //"3";
	
		$s_id=$this->input->get('s_id'); //选中的学生
	
		$now_year = date("Y");//当前年份
		$now_month = date("m");  //04格式
		$d_year = substr($term,0,4);  //所选年份 
		if($now_month>=3&&$now_month<=8){ //判断当前学期
			$now_term="春期";
		}else{
			$now_term="秋期";
		}
		if($now_year!=$d_year||($now_year==$d_year&&$now_term!=$sub_term)){ 
			 //不是当前学期;
			$query=$this->Deyu_model->adm_get_total_deyu($class_id,$term);
			if($query){
				echo json_encode($query); 
			}else{
				echo "fail";
			}
		}else{ //是当前学期

			if($month==""||$s_id==""){ //查询本学期总分
				$query=$this->Deyu_model->adm_get_total_deyu($class_id,$term);
				if($query){
					echo json_encode($query); 
				}
			}else{
			 //查看选中同学的德育
				$query=$this->Deyu_model->adm_get_stu_detail_deyu($class_id,$term,$month,$s_id);
				if($query){
					echo json_encode($query);
				}else{
					echo "fail";
				}
			}
				
			}
							
	
	}
	
	//辅导员和考评查看文体成绩
	public function adm_get_wenti(){
		$class_id=$this->input->get('class_id');//31;
		$c_id=$this->input->get('c_id');
		$term =$this->input->get('get_term'); //"2017年秋季";
		$sub_term = substr($term,7);
		$month =$this->input->get('month');// "3";
		$now_year = date("Y");//当前年份
		$now_month = date("m");  //04格式
		$d_year = substr($term,0,4);  //所选年份 
		if($now_month>=3&&$now_month<=8){ //判断当前学期
			$now_term="春期";
		}else if($now_month>=9&&$now_month<=12||$now_month>=1&&$now_month<=2){
			$now_term="秋期";
		}
		if($now_year!=$d_year||($now_year==$d_year&&$now_term!=$sub_term)){ 
			 //不是当前学期
			$query=$this->Wenti_model->adm_get_total_wenti($class_id,$term);
			if($query){
				echo json_encode($query); 
			}else{
				echo "fail";
			}
		}else{ //是当前学期
			if($month==""){ //查本学期该班级所有人
				$query=$this->Wenti_model->adm_get_total_wenti($class_id,$term);
				if($query){
					echo json_encode($query); 
				}else{
					echo "fail";
				}
			}else{
				$query=$this->Wenti_model->adm_get_detail_wenti($c_id,$class_id,$term,$month);
				if($query){
					echo json_encode($query);
				}else{
					echo "fail";
				}
			}
						
		}	
	}
}

	
	





