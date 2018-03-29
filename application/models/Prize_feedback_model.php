<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Prize_feedback_model extends CI_model{

// 奖项反馈表	
		//反馈添加
		public function add_feedback($data){
			$query=$this->db->insert('prize_back',$data);
			return $query;
		}
		//查询班级反馈
		public function get_class_feedback($class_id){
			$this->db->select('prize_back.*');
			$this->db->order_by('prize_back.time', 'DESC');
			$this->db->from('prize_back');
			$this->db->join('student', 'prize_back.u_id = student.s_id','left');
			$this->db->where('student.class_id',$class_id);
			$query = $this->db->get();
			return $query->result();
		}
		//查询未读信息量
		public function get_class_feedback_unread_num($class_id){
			$this->db->select('prize_back.*');
			$this->db->order_by('prize_back.time', 'DESC');
			$this->db->from('prize_back');
			$this->db->join('student', 'prize_back.u_id = student.s_id','left');
			$this->db->where('student.class_id',$class_id);
			$this->db->where('prize_back.seen',0);
			$query = $this->db->get();
			return $query->num_rows();
		}
		//查询未读信息
		public function get_class_feedback_unread($class_id){
			$this->db->select('prize_back.*');
			$this->db->order_by('prize_back.time', 'DESC');
			$this->db->from('prize_back');
			$this->db->join('student', 'prize_back.u_id = student.s_id','left');
			$this->db->where('student.class_id',$class_id);
			$this->db->where('prize_back.seen',0);
			$query = $this->db->get();
			return $query->result();
		}
		//修改班级反馈信息为已读
		public function class_feedback_seen($ids){
			$this->db->where_in('id', $ids);
			$data = array('seen'=>1);
			$query = $this->db->update('prize_back', $data);
			return $query;
		}
		
	}
?>