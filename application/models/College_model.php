<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class College_model extends CI_model{

//学院专业表
		
		//添加学院专业
		public function add_college($data){
			$query=$this->db->insert('college',$data);
			return $query;
		}
		//查询学院专业
		public function get_all_college($data){
			$query=$this->db->get_where('college',$data);
			return $query->result();
		}
		//查询学院
		public function get_college($data){
			$query=$this->db->get_where('college',$data);
			return $query->result();
		}
	}
?>