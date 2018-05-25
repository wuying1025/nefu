<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Admin_model extends CI_model{

// 管理员表
				
		//查询所有管理员信息
		public function get_all_admin(){
			$this->db->select('admin.*,college.name c_name');
			$this->db->order_by('college.c_id', 'ASC');
			$this->db->order_by('admin.grade', 'ASC');
			$this->db->from('admin');
			$this->db->join('college', 'admin.college = college.c_id','left');
			$query = $this->db->get();
			return $query->result();
		}

		//添加管理员
		public function add_admin($data){
			$query=$this->db->insert('admin',$data);
			return $query;
		}

		//删除导员
		public function del_admin($id){
			$this->db->where_in('a_id',$id);
			$this->db->delete('admin');
			return $this->db->affected_rows();
		}

		//管理员登录
		public function admin_login($data){
			$query=$this->db->get_where('admin',$data);
			return $query->row();
		}
		//检查密码
        public function get_by_id_pwd($a_id,$pwd){
            $query=$this->db->get_where('admin',array(
                'a_id'=>$a_id,
                'password' => $pwd
            ));
            return $query->row();
        }
        //更新密码
        public function update_pwd($a_id,$pwd){
            $this->db->where('a_id',$a_id);
            $this->db->update('admin',array(
                'password' => $pwd
            ));
            return $this->db->affected_rows();
		}
	

	}
?>