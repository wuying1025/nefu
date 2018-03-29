<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Student extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Student_model');
		$this->load->model('Message_model');
		$this->load->model('Prize_confirm_model');
		$this->load->model('Prize_feedback_model');
		$this->load->model('Prize_get_model');
		$this->load->model('Class_model');
        $this->load->model('log_model');
        $this->load->helper('Log');
		header("Access-Control-Allow-Origin: * "); 
	}

	//学生登录
	public function student_login(){
		$num = $this->input->get('stu_num');
		$psd = $this->input->get('stu_psd');
		$data1 = array('s_num'=>$num,'s_pass'=>md5($psd),'is_del'=>0);
		$data2 = array('s_num'=>$num,'is_del'=>0);
		$result1 = $this->Student_model->student_login($data1);
		$result2 = $this->Student_model->student_login($data2);
		if($result1&&$result2){
			//账号密码正确
            insert_log_data($result1->s_id,'登录',0);
			echo json_encode($result1);
		}else if($result2){
			//密码错误
			echo 'error';
		}else{
			//账号错误
			echo 'fail';
		}
	}
	//添加留言
	public function add_message(){
		$uid = $this->input->get('uid');
		$content = $this->input->get('content');
		$uname=$this->input->get('u_name');
		$grade = $this->input->get('grade');
		$college_id = $this->input->get('college_id');
		$data1 = array(
			'u_id'=>$uid,'m_content'=>$content,
			'm_time'=>date('Y-m-d H:i:s'),'u_name'=>$uname
			);
		$data2 = array(
			'grade'=>$grade,'college'=>$college_id
			);
		$result = $this->Message_model->add_message($data1,$data2);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//根据班级id 查询 学院id
	public function get_college_by_class_id(){
			$result = $this->Admin_model->get_all_admin();
			echo  json_encode($result);
	}
	public function udpate_student_Info(){
		$id= $this->input->get('id');
		$name= $this->input->get('name');
		$num= $this->input->get('num');
		$sex= $this->input->get('sex');
		$result = $this->Student_model->udpate_student_Info($id,$name,$num,$sex);
		echo 'success';

	}
	//录入班级奖项信息
	public function input_get_item_info(){
			$info= $this->input->get('info');
			$data = array();
			for($i=0;$i<count($info);$i++){
				$item = json_decode($info[$i]);
				$arr = array(
					'u_id'=>$item->u_id,
					'u_name'=>$item->u_name,
					'i_id'=>$item->i_id,
					'i_name'=>$item->i_name,
					'add_time'=>$item->add_time,
					'i_status'=>'待确定'
					);
					array_push($data,$arr);
				}
			$result = $this->Prize_confirm_model->add_prize($data);
			if($result){
				echo 'success';
			}else{
				echo 'fail';
			}
	}

	//录入个人奖项信息
	public function add_person_item_info(){
		$u_id = $this->input->get('u_id');
		$u_name = $this->input->get('u_name');
		$items = $this->input->get('items');
		$add_time = $this->input->get('add_time');
		$data = array();
		for($i=0;$i<count($items);$i++){
			$item = json_decode($items[$i]);
			$arr = array(
				'u_id'=>$u_id,
				'u_name'=>$u_name,
				'i_id'=>$item->id,
				'i_name'=>$item->name,
				'add_time'=>$add_time,
				'i_status'=>'待确定'
			);
			array_push($data,$arr);
		}
		$result = $this->Prize_confirm_model->add_prize($data);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//查看班级录入的信息
	public function get_class_info(){
		$class_id = $this->input->get('class_id');
		$result = $this->Prize_confirm_model->get_class_info($class_id);
		$result123 =   []; 
		foreach($result as $k){
		    $result123[$k->u_id][] = $k; 
		}
		echo json_encode($result123);
	}

	//查看个人新的录入信息
	public function get_new_info_by_uid(){
		$u_id = $this->input->get('u_id');
		$data = array('u_id'=>$u_id);
		$result = $this->Prize_confirm_model->get_new_info($data);
		echo json_encode($result);

	}
	//查询待确认的信息数量
	public function get_pending_num(){
		$u_id = $this->input->get('u_id');
		$data = array('u_id'=>$u_id,'i_status'=>'待确定');
		$result = $this->Prize_confirm_model->get_new_info($data);
		echo count($result);
	}
	//确认奖项
	public function comfirm_item(){
		$p_id = $this->input->get('p_id');
		$data = array('i_status'=>'已确定');
		$result = $this->Prize_confirm_model->comfirm_item($data,$p_id);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//删除奖项
	public function delete_info(){
		$p_id = $this->input->get('p_id');
		$result = $this->Prize_confirm_model->delete_info($p_id);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}

	//奖项确认反馈
	public function info_feedback(){
		$uid = $this->input->get('u_id');
		$pid = $this->input->get('p_id');
		$content = $this->input->get('content');
		$uname = $this->input->get('u_name');
		$data = array(
			'b_content'=>$content,'u_id'=>$uid,
			'u_name'=>$uname,'p_id'=>$pid,
			'time'=>date('Y-m-d H:i:s')
			);
		$result = $this->Prize_feedback_model->add_feedback($data);
		if($result){
			echo 'success';
		}else{		
			echo 'fail';
		}
	}

	//查询班级反馈
	public function get_class_feedback(){
		$class_id = $this->input->get('class_id');
		$result = $this->Prize_feedback_model->get_class_feedback($class_id);
		echo  json_encode($result);	
	}
	//查询班级未读反馈信息量
	public function get_class_feedback_unread_num(){
		$class_id = $this->input->get('class_id');
		$result = $this->Prize_feedback_model->get_class_feedback_unread_num($class_id);
		echo  $result;	
	}
	//修改班级信息反馈已读状态
	public function class_feedback_seen(){
		$class_id = $this->input->get('class_id');
		$result1 = $this->Prize_feedback_model->get_class_feedback_unread($class_id);
		$ids =   array(); 
		foreach($result1 as $res){
		    array_push($ids, $res->id);
		}
		$result2 = $this->Prize_feedback_model->class_feedback_seen($ids);
		if($result2){
    		echo 'success';
        }else{
            echo 'fail';
        }
	}
	//图片上传
    public function do_upload()
    {
        $config['upload_path']  = './uploads/';
        $config['allowed_types']    = 'jpg|gif|png';
        $config['max_size']     = 2048;
        $s_id = $this ->input->post('s_id');
        $config['file_name']  = $s_id."_".date("YmdHis");
        $this->load->library('upload', $config);
        if ( ! $this->upload->do_upload('userfile'))
        {
            echo 'fail';
        }
        else
        {
            $path = $this->upload->data();
            $this->load->model('Student_model');
            $img_path  = 'http://127.0.0.1/nefu/uploads/'.$path['file_name'];
            $row = $this->Student_model->update_face($s_id,$img_path);
            if($row>0){
            	insert_log_data($s_id,'上传头像',0);
                echo $img_path;
            }else{
                echo 'fail';
            }
        }
    }

    //检查旧密码
    public function check_pwd()
    {
        $s_id = $this->input->get('s_id');
        $pwd = $this->input->get('pwd');
        $pwd = md5($pwd);
        $result = $this->Student_model->get_by_id_pwd($s_id,$pwd);
        if($result){
            echo 'success';
        }else{
            echo 'fail';
        }
    }

    //修改密码
    public function update_password()
    {
        $s_id = $this->input->post('s_id');
        $pwd = $this->input->post('pwd');
        $pwd = md5($pwd);
        $result = $this->Student_model->update_pwd($s_id,$pwd);
        if($result){
            insert_log_data($s_id,'修改密码',0);
            echo 'success';
        }else{
            echo 'fail';
        }
    }

    //获取学生自己的所有操作记录
    public function get_log()
    {
        $s_id = $this->input->get('s_id');
        $result = $this->log_model->get_all_by_id($s_id);
        if($result){
            echo json_encode($result);
        }else{
            echo 'fail';
        }
    }

	//提交 -修改提交状态
    public function sub_class_info(){
    	$class_id = $this->input->get('class_id');
    	$result1 = $this->Prize_confirm_model->get_class_info($class_id);
		$pids =   array(); 
		foreach($result1 as $res){
		    array_push($pids, $res->p_id);
		}
    	$result2 = $this->Prize_confirm_model->sub_class_info($pids);
    	if($result2){
    		echo 'success';
        }else{
            echo 'fail';
        }

    }
    //获取个人基本信息
    public function student_basic_information(){
    	$s_id = $this->input->get('s_id');
    	$result = $this->Student_model->student_basic_information($s_id);
    	echo json_encode($result);
    }
    //获取个人学院信息
    public function student_college_information(){
    	$class_id = $this->input->get('class_id');
    	$result = $this->Class_model->student_college_information($class_id);
    	echo json_encode($result);
    }
    //获取学生获奖信息
    public function student_prize_information(){
    	$s_id = $this->input->get('s_id');
    	$result1 = $this->Prize_get_model->student_political_prize_information($s_id);
    	$result2 = $this->Prize_get_model->student_intelligence_prize_information($s_id);
    	$result3 = $this->Prize_get_model->student_ability_prize_information($s_id);
    	$data = array(
  			'political'=>$result1,
  			'intelligence'=>$result2,
  			'ability'=>$result3);
    	echo json_encode($data);
    }
    //重置密码
    public function reset()
    {
        $s_id = $this->input->get('s_id');
        $newpwd = $this->input->get('newpwd');
        $pwd = md5($newpwd);
        $result = $this->Student_model->update_pwd($s_id,$pwd);
        if($result){
            echo 'success';
        }else{
            echo 'fail';
        }
    }
    
	
	
	

}

	



