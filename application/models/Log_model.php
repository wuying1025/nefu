<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Log_model extends CI_model{

    //增加操作记录
    public function add_record($data){
        $query=$this->db->insert('log',$data);
        return $query;
    }
    //查找操作记录
    public function get_all_by_id($s_id){
        $this->db->select('log.time, log.do');
        $this->db->from('log');
        $this->db->where('u_id',$s_id);
        $this->db->order_by('log.time','desc');
        return $this->db->get()->result();
    }
    //查询学生日志
    public function get_all_stu_log(){
        $this->db->select('log.*,student.*');
        $this->db->from('log');
        $this->db->where('genre',0);
        $this->db->join('student', 'log.u_id = student.s_id','left');
        $this->db->order_by('log.time','desc');
        return $this->db->get()->result();
    }
    //查询管理员日志
    public function get_all_admin_log(){
        $this->db->select('log.*,admin.*');
        $this->db->from('log');
        $this->db->where('log.genre',1);
        $this->db->join('admin', 'log.u_id = admin.a_id','left');
        $this->db->order_by('log.time','desc');
        return $this->db->get()->result();
    }

}
?>