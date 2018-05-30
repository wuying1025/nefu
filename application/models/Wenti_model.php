<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Wenti_model extends CI_model{
        //学生录入文体成绩
        public function add_wenti($data){
            $query=$this->db->insert('wenti',$data);
            return $query;
        }
        //学生查看自己文体成绩
        public function get_self_wenti($s_num,$term,$month){
            $sql="select w_id,wenti.s_num,student.s_name,get_term,month,w_why,w_type,w_cfm as score from wenti,student where wenti.s_num=student.s_num and wenti.s_num='$s_num' and get_term='$term' and month='$month' ";    
            $query = $this->db->query($sql);
            return $query->result();
        } 
        //学生查看超过一学期的文体总成绩
        public function self_total_wenti($s_num,$term){
            $sql="select wenti.s_num,s_name,sum(w_cfm) as score from wenti,student where wenti.s_num=student.s_num and get_term='$term' and wenti.s_num='$s_num' and w_sta=2;";
            $query=$this->db->query($sql);
            return $query->result();
        }
        //班级查看文体成绩，只能看到总分
        public function class_total_wenti($classId,$term){
            $sql="select wenti.s_num,student.s_name,sum(w_cfm) as score from wenti,student 
            where is_del=0 and class_id='$classId' and get_term='$term' and w_sta=2 and wenti.s_num=student.s_num GROUP BY wenti.s_num;";
            $query=$this->db->query($sql);
            return $query->result();
        }
        //考评更改学生文体成绩
        public function upd_wenti($arr1,$arr2){
            // $this->db->where('w_id',$w_id);
            // $update=$this->db->update('wenti',$arr1);
            $update=$this->db->update('wenti',$arr1,$arr2);
            return $update;
        }
        //辅导员和考评查看超过一学期文体成绩 
        public function adm_get_total_wenti($class_id,$term){
            $sql="select wenti.s_num,student.s_name,class_name,college.name,sum(w_cfm) as score from wenti,class,student,college
            where is_del=0 and wenti.s_num=student.s_num and student.class_id=class.id  and class.c_id=college.c_id
                        and get_term='$term' and class.id='$class_id' and w_sta=2 group by wenti.s_num;";
            $query=$this->db->query($sql);
            return $query->result();
        }
        //辅导员和考评查看本学期文体成绩  //专业班级
        public function adm_get_detail_wenti($c_id,$class_id,$term,$month){
            $sql="select w_id,wenti.s_num,student.s_name,class_name,college.name as cname,
            get_term,month,w_why,w_self,w_type,w_cfm,w_who,w_sta  from wenti,class,student,college 
            where is_del=0 and wenti.s_num=student.s_num and 
            student.class_id=class.id and class.p_id=college.c_id
                        and get_term='$term' and class.id='$class_id' 
                        and month='$month' and class.p_id='$c_id';";
            $query=$this->db->query($sql);
            return $query->result();
        } 
        //学生查看当前学期文体总分
        public function get_cur_deyu($s_num,$get_term){
            $sql="select s_num,sum(w_cfm) from wenti
                where w_sta=2 and s_num='$s_num' and get_term='$get_term';";
            $query=$this->db->query($sql);
            return $query->result();
        }
    }
    
