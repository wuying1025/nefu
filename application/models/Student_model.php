<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Student_model extends CI_model{

// 学生表	
		
		//查询所有学生	
		public function all_student(){
			$query=$this->db->get_where('student',array(
                'is_del' => 0
            ));
			return $query->result();
		}

        //根据专业id,班级,年级,学院查询学生
        public function get_students_admin($college,$profession,$class,$grade){

            $this->db->select('student.*,class.*');
            $this->db->from('student');
            $this->db->join('class', 'student.class_id = class.id');
            if($profession != '') {
                $this->db->join('college', 'class.p_id = college.c_id');
                $this->db->where('college.c_id', $profession);
            }
            if($grade != ''){
                $this->db->where('student.grade', $grade);
            }
            if($class != ''){
                $this->db->where('student.class_id', $class);
            }
            if($college != ''){
                $this->db->where('student.college_id', $college);
            }
            $this->db->where('student.is_del', 0);
            $query = $this->db->get();
            return $query->result();
        }

        public function del_student($del_id){

            $this->db->where_in('s_id',$del_id);
            $this->db->update('student',array(
                'is_del' => 1
            ));

            return $this->db->affected_rows();
        }

        public function udpate_student_Info($id,$name,$num,$sex){
            $this->db->where_in('s_id',$id);
            $this->db->update('student',array(
                's_name' => $name,
                's_num'=>$num,
                'sex'=>$sex
            ));

            return $this->db->affected_rows();
        }

		//添加学生
		public function add_student($data){
			$query=$this->db->insert('student',$data);
			return $query;
		}
		//条件查询学生
		public function get_student($data){
			$query=$this->db->get_where('student',$data);
			return $query->result();
		}
		//学生登录
		public function student_login($data){
			$query=$this->db->get_where('student',$data);
			return $query->row();
		}

		//class_id查询学生 只返回 学生id 和学生name
		public function get_student_by_class_id($id){
			$this->db->select('s_id,s_name,s_num,class_id,is_monitor,grade,college_id');
			$this->db->where('class_id',$id);
            $this->db->where('is_del',0);
			$query=$this->db->get('student');
			return $query->result();
		}
		//根据年级和学院查新
		public function get_all_student_by_grade_college($data){
			$this->db->select('s_id,s_name,s_num,class_id,is_monitor,grade,college_id');
			$query=$this->db->get_where('student',$data);
			return $query->result();
		}

		
        //更新头像
        public function update_face($s_id,$path){
            $this->db->where('s_id',$s_id);
            $this->db->update('student',array(
                'img' => $path
            ));
            return $this->db->affected_rows();
        }
        //检查密码
        public function get_by_id_pwd($s_id,$pwd){
            $query=$this->db->get_where('student',array(
                's_id'=>$s_id,
                's_pass' => $pwd
            ));
            return $query->row();
        }
        //更新密码
        public function update_pwd($s_id,$pwd){
            $this->db->where('s_id',$s_id);
            $this->db->update('student',array(
                's_pass' => $pwd
            ));
            return $this->db->affected_rows();
        }

        //设定班长
        public function set_monitor($s_id){
        	$this->db->where('s_id',$s_id);
            $this->db->update('student',array(
                'is_monitor' => 1
            ));
            return $this->db->affected_rows();
        }
         //取消班长
        public function cancel_monitor($s_id){
        	$this->db->where('s_id',$s_id);
            $this->db->update('student',array(
                'is_monitor' => 0
            ));
            return $this->db->affected_rows();
        }
        //替换班长
        public function exChange_monitor($new_id,$old_id){
        	$this->db->where('s_id',$old_id);
            $this->db->update('student',array(
                'is_monitor' => 0
            ));
            $this->db->where('s_id',$new_id);
            $this->db->update('student',array(
                'is_monitor' => 1
            ));
            return $this->db->affected_rows();
        }
        //学生个人基本信息
        public function student_basic_information($sid){
            $this->db->select('student.*,college.*');
            $this->db->from('student');
            $this->db->join('college', 'student.college_id = college.c_id','left');
            $this->db->where('student.s_id',$sid);
            $query = $this->db->get();
            return $query->result();
        }
        public function get_student_by_num($num){
            $query = $this->db->get_where('student',array('s_num'=>$num,'is_del'=>0));
            return $query->result();
        }
         //搜索学生
        public function get_stu($what,$way){
            if($way=='name'){
                $data = array(
                    's_name'=>$what
                );
                $this->db->like('s_name', $what);
            }else{
                $data = array(
                    's_num'=>$what
                );
                $this->db->like('s_num', $what);
            }
            $query=$this->db->get_where('student',array('is_del'=>0));
            return $query->result();
        }
        

	}
?>