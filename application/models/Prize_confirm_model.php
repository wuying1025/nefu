<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Prize_confirm_model extends CI_model{

// 录入奖项表	
		
		//添加
		public function add_prize($data){
			$query=$this->db->insert_batch('prize_confirm',$data);
			return $query;
		}
		//查询新的信息
		public function get_new_info($data){
			$this->db->order_by('i_id', 'ASC');
			$this->db->order_by('i_status', 'ASC');
			$query=$this->db->get_where('prize_confirm',$data);
			return $query->result();
		}
		//状态更新
		public function comfirm_item($data,$id){
			$this->db->where('p_id', $id);
			$query = $this->db->update('prize_confirm',$data);
			return $query;
		}
		//根据班级id 查找所有录入的信息----班长
		public function get_class_info($class_id){
			$this->db->select('prize_confirm.*');
			$this->db->order_by('prize_confirm.u_id', 'ASC');
			$this->db->order_by('prize_confirm.i_id', 'ASC');
			$this->db->from('prize_confirm');
			$this->db->where('prize_confirm.is_submit',0);
			$this->db->join('student', 'prize_confirm.u_id = student.s_id','left');
			$this->db->where('student.class_id',$class_id);
			$query = $this->db->get();
			return $query->result();
		}
		//根据班级id 查找所有提交的信息------导员
		public function get_submit_class_info($class_id){
			$this->db->select('prize_confirm.*');
			$this->db->order_by('prize_confirm.u_id', 'ASC');
			$this->db->order_by('prize_confirm.i_id', 'ASC');
			$this->db->from('prize_confirm');
			$this->db->where('prize_confirm.is_submit',1);
			$this->db->join('student', 'prize_confirm.u_id = student.s_id','left');
			$this->db->where('student.class_id',$class_id);
			$query = $this->db->get();
			return $query->result();
		}
		//根据学院和年级查找所有提交的录入的信息
		public function get_info_by_college_grade($college_id,$grade){
			$this->db->select('prize_confirm.*');
			$this->db->order_by('prize_confirm.u_id', 'ASC');
			$this->db->order_by('prize_confirm.i_id', 'ASC');
			$this->db->from('prize_confirm');
			$this->db->where('prize_confirm.is_submit',1);
			$this->db->where('prize_confirm.i_status','已确定');
			$this->db->join('student', 'prize_confirm.u_id = student.s_id','left');
			$this->db->where('student.college_id',$college_id);
			$this->db->where('student.grade',$grade);
			$query = $this->db->get();
			return $query->result();
		}
		//删除信息
		public function delete_info($pid){
			$this->db->where('p_id', $pid);
			$query = $this->db->delete('prize_confirm');
			return $query;
		}
		//删除班级信息
		public function delete_class_info($data){
			$this->db->where_in('p_id',$data);
			$query = $this->db->delete('prize_confirm');
			return $query;
		}
		//更新信息
		public function update_prize_info($data,$pid){
			$this->db->where('p_id', $pid);
			$query = $this->db->update('prize_confirm', $data);
			return $query;
		}

		//提交信息
		public function sub_class_info($pids){
			$this->db->where_in('p_id', $pids);
			$data = array('is_submit'=>1);
			$query = $this->db->update('prize_confirm', $data);
			return $query;
		}
		//驳回提交
		public function cancel_sub_class_info($pids){
			$this->db->where_in('p_id', $pids);
			$data = array('is_submit'=>0);
			$query = $this->db->update('prize_confirm', $data);
			return $query;
		}
		
	}
?>