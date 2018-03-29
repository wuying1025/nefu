<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Message_model extends CI_model{

// 留言表
		//添加留言
		public function add_message($data1,$data2){
			$this->db->select('admin.a_id');
			$this->db->from('admin');
			$this->db->where($data2);
			$aid = $this->db->get()->row();
			//查询自己的导员的id 
			$arr = array('a_id'=>$aid->a_id);
			$data1 = array_merge($data1,$arr);
			$query=$this->db->insert('message',$data1);
			return $query;
		}
		//根据管理员id 查询留言
		public function get_message_by_id($data){
			$this->db->order_by('m_time', 'desc');
			$query = $this->db->get_where('message',$data);
			return $query->result();
		}
		//回复留言
		public function reply_message($data){
			$query=$this->db->insert('message',$data);
			return $query;
		}
		//删除留言、回复
		public function delete_message($data){
			$this->db->where($data);
			$query = $this->db->delete('message');
			return $query;

		}

	}
?>