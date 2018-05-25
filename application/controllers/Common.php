<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Common extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Items_model');
		$this->load->model('Class_model');
		$this->load->model('College_model');
		$this->load->model('Student_model');
		$this->load->model('Message_model');
		$this->load->model('Prize_confirm_model');
		header("Access-Control-Allow-Origin: * "); 
	}

	//pid查询奖项
	public function get_item_by_pid(){
		$pid = $this->input->get('pid');
		$data= array(
			'pid'=>$pid
			);
		$result = $this->Items_model->get_item_by_pid($data);
		echo  json_encode($result);
	}

	// 所有奖项
	public function get_all_item(){
		$result = $this->Items_model->get_items();
		echo  json_encode($result);
	}
	//二级奖项
	public function get_second_items(){
		$result = $this->Items_model->get_second_items();
		echo  json_encode($result);
	}
	//三级奖项
	public function get_third_items(){
		$result = $this->Items_model->get_third_items();
		echo  json_encode($result);
	}

	//查询所有班级
	public function get_all_class(){
		$result = $this->Class_model->get_all_class();
		echo  json_encode($result);
	}
	//根据专业id查询班级  
	public function get_class_by_pid_grade(){
	 	$pid = $this->input->get('pid');
		$grade = $this->input->get('grade');
		$data =array('p_id'=>$pid,'grade'=>$grade); 
		$result = $this->Class_model->get_class($data);
		echo  json_encode($result);
	}

	//根据专业id,班级,年级,学院查询学生
	public function get_students_admin(){
		$college = $this->input->get('college');
	    $profession = $this->input->get('profession');
		$class = $this->input->get('class');
		$grade = $this->input->get('grade');
		$result = $this->Student_model->get_students_admin($college,$profession,$class,$grade);
		echo json_encode($result);
	}

	public function del_student(){
		$del_id = $this->input->get('delId');
		$result = $this->Student_model->del_student($del_id);
		echo $result;
	}
	
	//获得所有学院专业
	public function get_all_college(){
		$data = array('pid'=>0);
		$result = $this->College_model->get_all_college($data);
		echo  json_encode($result);
	}

	//获得所有学院
	public function get_college(){
		$data = array('pid'=>0);
		$result = $this->College_model->get_college($data);
		echo  json_encode($result);
	}

	//查询学院下专业
	public function get_profession(){
		$pid = $this->input->get('pid');
		$data = array('pid'=>$pid);
		$result = $this->College_model->get_college($data);
		echo  json_encode($result);
	}

	//查询所有学生
	public function all_student(){
		$result = $this->Student_model->all_student();
		echo json_encode($result);
	}

	//根据班级id查询班级学生
	public function get_student(){
		$class_id = $this->input->get('class_id');
		$data =array('class_id'=>$class_id,'is_del'=>0);
		$result = $this->Student_model->get_student($data);
		echo  json_encode($result);
	}
	//根据班级id查询班级学生
	public function get_student_by_class_id(){

		$class_id= $this->input->get('class_id');
		//var_dump($class_id);
		$result = $this->Student_model->get_student_by_class_id($class_id);
		echo json_encode($result);
	}
	//根据年级和学院查询学生
	public function get_all_student_by_grade_college(){
		$grade = $this->input->get('grade');
		$college  = $this->input->get('college_id');
		$data = array(
			'grade'=>$grade,'college_id'=>$college,'is_del'=>0);
		$result = $this->Student_model->get_all_student_by_grade_college($data);
		echo  json_encode($result);
	}
	//管理员查看对自己的留言
	public function get_message_by_aid(){
		$aid = $this->input->get('a_id');
		$data = array('a_id'=>$aid,'reply'=>0);
		$result  = $this->Message_model->get_message_by_id($data);
		echo json_encode($result);
	}
	//获取自己的留言
    public function get_message_by_sid(){
    	$sid = $this->input->get('s_id');
		$data = array('u_id'=>$sid,'reply'=>0);
		$result  = $this->Message_model->get_message_by_id($data);
		echo json_encode($result);
    }

    //查看回复我的
    public function get_my_reply_sid(){
    	$sid = $this->input->get('s_id');
		$data = array('u_id'=>$sid,'reply'=>1);
		$result  = $this->Message_model->get_message_by_id($data);
		echo json_encode($result);
    }
    
	//管理员回复留言
	public function reply_message(){
		$uid = $this->input->get('uid');
		$aid = $this->input->get('aid');
		$uname = $this->input->get('u_name');
		$content = $this->input->get('content');
		$data = array(
			'u_id'=>$uid,'a_id'=>$aid,'u_name'=>$uname,
			'm_content'=>$content,'m_time'=>date('Y-m-d H:i:s'),
			'reply'=>1);
		$result = $this->Message_model->reply_message($data);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//查看我的回复
	public function get_my_reply_aid(){
		$aid = $this->input->get('a_id');
		$data = array('a_id'=>$aid,'reply'=>1);
		$result  = $this->Message_model->get_message_by_id($data);
		echo json_encode($result);
	}
	//删除回复
	public function delete_reply(){
		$mid= $this->input->get('m_id');
		$data = array('m_id'=>$mid);
		$result = $this->Message_model->delete_message($data);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}
	//更改信息
	public function update_prize_info(){
		$pid = $this->input->get('p_id');
		$iname = $this->input->get('i_name');
		$i_id = $this->input->get('i_id');
		$data = array('i_name'=>$iname,'i_id'=>$i_id);
		$result = $this->Prize_confirm_model->update_prize_info($data,$pid);
		if($result){
			echo 'success';
		}else{
			echo 'fail';
		}
	}

	public function person_to_prize()
    {
        $num = $this->input->get('num');
        $name = $this->input->get('name');
        $term = $this->input->get('term');
        $result = $this->Prize_confirm_model->get_person_to_prize(trim($num), trim($name), trim($term));
        echo json_encode($result);
    }


}

	



