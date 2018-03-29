<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Prize_get_model extends CI_model{

// 已获奖项表
		
		//添加
		public function add_prize($data){
			$query=$this->db->insert_batch('prize_get',$data);
			return $query;
		}
		//查询已获奖项
		public function get_prize($data){
			$query = $this->db->get_where('prize_get',$data);
			return $query->result();
		}
		//根据学院和年级查找已获奖项的信息
		public function get_info_by_college_grade($college_id,$grade){
			$this->db->select('prize_get.*');
			$this->db->order_by('prize_get.u_id', 'ASC');
			$this->db->order_by('prize_get.i_id', 'ASC');
			$this->db->from('prize_get');
			$this->db->join('student', 'prize_get.u_id = student.s_id','left');
			$this->db->where('student.college_id',$college_id);
			$this->db->where('student.grade',$grade);
			$query = $this->db->get();
			return $query->result();
		}
		//获取学生的政治思想获奖信息
		public function student_political_prize_information($s_id){
			$sql = "select * from prize_get where (u_id = $s_id and i_id in (select id from items where pid in (select id from items where pid = 1)))";
			$query = $this->db->query($sql);
			return $query->result();
		}
		//获取学生的智能素质获奖信息
		public function student_intelligence_prize_information($s_id){
			$sql = "select * from prize_get where (u_id = $s_id and i_id in (select id from items where pid in (select id from items where pid = 2)))";
			$query = $this->db->query($sql);
			return $query->result();
		}
		//获取学生的能力发展获奖信息
		public function student_ability_prize_information($s_id){
			$sql = "select * from prize_get where (u_id = $s_id and i_id in (select id from items where pid in (select id from items where pid = 3)))";
			$query = $this->db->query($sql);
			return $query->result();
		}



		
	}
?>