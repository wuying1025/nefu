<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Class_model extends CI_model{

//班级表

		//添加班级
		public function add_class($data){
			$query=$this->db->insert('class',$data);
			return $query;
		}
		//查询所有班级
		public function get_all_class(){
			$this->db->select('class.*,college.name c_name');
			$this->db->order_by('class.c_id', 'ASC');
			$this->db->order_by('class.grade', 'ASC');
			$this->db->order_by('class.p_id', 'ASC');
			$this->db->order_by('class.class_name', 'ASC');
			$this->db->distinct();
			$this->db->from('class');
			$this->db->join('college', 'class.p_id = college.c_id','left');
			$query = $this->db->get();
			return $query->result();
		}
		// 查询同一专业的班级
		public function get_class($data){
		$this->db->order_by('class_name');
		$query=$this->db->get_where('class',$data);
		return $query->result();
		}
		//学生学院信息
        public function student_college_information($class_id){
            $this->db->select('class.*,college.*');
            $this->db->from('class');
            $this->db->join('college', 'class.p_id = college.c_id','left');
            $this->db->where('class.id',$class_id);
            $query = $this->db->get();
            return $query->result();
        }
		
		
		
	}
?>