<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Deyu_model extends CI_model{
        //学生录入德育
        public function add_deyu($data){
            $query=$this->db->insert_batch('deyu',$data);
            return $query;
        }
        //学生查看自己德育加分  减分  tag ??  当前学期德育
        public function self_deyu($data){
            $query=$this->db->get_where('deyu',$data);
			return $query->result();
        }
        //学生查看超过一学年的德育总成绩  
        public function self_total_deyu($s_num,$term){
         // $query=$this->db->select_sum("d_cfm")->get_where('deyu',$data);
         $sql="select sum(d_cfm)+d_base as score from deyu where s_num='$s_num' and get_term='$term' and d_sta=2";
         $query=$this->db->query($sql);
          return $query->result();
        }
        //本学期内班级德育  
        public function class_deyu($classId,$term,$month){
            $sql="select deyu.s_num,deyu.get_term,student.s_name,sum(d_cfm)+deyu.d_base from deyu,student where class_id='$classId' and get_term='$term'
             and deyu.s_num=student.s_num and month='$month' and d_sta=2 and is_del=0 group by s_num;";
            $query=$this->db->query($sql);
			return $query->result();
        }
        //班级查看超过一学期的德育成绩  
        public function class_total_deyu($classId,$term){
            $sql="select class_id,deyu.s_num,student.s_name,get_term,sum(d_cfm)+deyu.d_base as score 
            from deyu,student   
            where is_del=0 and class_id='$classId' and get_term='$term' and d_sta=2 and deyu.s_num=student.s_num group by deyu.s_num;";
            $query=$this->db->query($sql);
            return $query->result();
        }
        //考评更改学生德育加分 
        public function upd_deyu($arr1,$arr2){
            $update=$this->db->update('deyu',$arr1,$arr2);
            return $update;
        }
        //考评更改学生德育减分 
        public function upd_short_deyu($arr1,$arr2){
            $update=$this->db->update('deyu',$arr1,$arr2);
            return $update;
        }
        //辅导员和考评查看超过一学期德育成绩 
        public function adm_get_total_deyu($class_id,$term){
            $sql="select deyu.s_num,student.s_name,student.class_id,sum(d_cfm)+d_base as score from deyu,class,student 
            where is_del=0 and deyu.s_num=student.s_num and student.class_id=class.id 
            and get_term='$term' and class.id='$class_id' and d_sta=2 group by deyu.s_num;";
            $query=$this->db->query($sql);
            return $query->result();
        }
        //辅导员和考评查看本学期德育成绩 
        public function adm_get_detail_deyu($class_id,$term,$month){
            $sql="select deyu.s_num,student.s_name,d_tag,get_term,d_why,d_self,d_cfm,d_who from deyu,class,student 
            where is_del=0 and deyu.s_num=student.s_num and student.class_id=class.id 
            and get_term='$term' and class.id='$class_id' and month='$month';";
            $query=$this->db->query($sql);
            return $query->result();
        }
        //辅导员和考评查看本学期所选同学的德育成绩 
        public function adm_get_stu_detail_deyu($class_id,$term,$month,$s_id){
            $sql="select deyu.s_num,student.s_name,d_content,d_tag,get_term,d_why,d_self,d_cfm,d_who,d_sta from deyu,student 
            where deyu.s_num=student.s_num
            and get_term='$term' and student.s_id='$s_id' and class_id='$class_id' and month='$month';";
            $query=$this->db->query($sql);
            return $query->result();
        }
        //学生查看当前学期德育总分
        public function get_cur_deyu($s_num,$get_term){
            $sql="select sum(d_cfm)+d_base as score from deyu
             where d_sta=2 and s_num='$s_num' and get_term='$get_term';";
            $query=$this->db->query($sql);
            return $query->result();
        }
    }
