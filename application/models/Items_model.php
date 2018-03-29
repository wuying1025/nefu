<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Items_model extends CI_model{

// 奖项表	

		//根据pid 查询奖项
		public function get_item_by_pid($data){
			$query=$this->db->get_where('items',$data);
			return $query->result();
		}
		// 查询所有奖项
		public function get_items(){
			$query=$this->db->get_where('items');
			return $query->result();
		}
		//添加奖项
		public function add_items($data){
			$query=$this->db->insert('items',$data);
			return $query;
		}

		public function get_second_items(){
			$sql = 'select * from items where pid in (select id from items where pid = 0)';
			$query = $this->db->query($sql);
			return $query->result();
		}
		//查询三级奖项
		public function get_third_items(){
			// $this->db->select('*');
			// $this->db->from('items');
			// $this->db->join('student', 'prize_confirm.u_id = student.s_id','left');
			// $this->db->where_in('pid',$class_id);
			$sql = 'select * from items where pid in (select id from items where pid in (select id from items where pid = 0) )';
			$query = $this->db->query($sql);
			return $query->result();

		}
		//删除3级
		public function delete_items3($id){
			$this->db->where('id',$id);
			$query=$this->db->delete('items');
			return $query;
		}
		//删除2级
		public function delete_items2($id){
			$this->db->where('id',$id);
			$this->db->or_where('pid',$id);
			$query=$this->db->delete('items');
			return $query;
		}
		//删除1级
		public function delete_items1($id){
			//$sql = "delete from items where pid in (select id from items where pid = $id)";
			$sql1 = "select id from items where pid = $id";
			$arr = $this->db->where('pid',$id)->get('items')->result();
			$arrid = array();
			 for($i=0;$i<count($arr);$i++){
			 	array_push($arrid,$arr[$i]->id);
			 }
			$this->db->where('id',$id);
			$this->db->or_where('pid',$id);
			if(count($arrid)!=0){
				$this->db->or_where_in('pid',$arrid);
			}
			$query= $this->db->delete('items');
			return $query;
		}
		
	}
?>