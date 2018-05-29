<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Prize_get_model extends CI_model
{

// 已获奖项表

    //添加
    public function add_prize($data)
    {
        $query = $this->db->insert_batch('prize_get', $data);
        return $query;
    }

    //查询已获奖项
    public function get_prize($data)
    {
        $query = $this->db->get_where('prize_get', $data);
        return $query->result();
    }

    //根据学院和年级查找已获奖项的信息
    public function get_info_by_college_grade($college_id, $grade)
    {
        $this->db->select('prize_get.*');
        $this->db->order_by('prize_get.u_id', 'ASC');
        $this->db->order_by('prize_get.i_id', 'ASC');
        $this->db->from('prize_get');
        $this->db->join('student', 'prize_get.u_id = student.s_id', 'left');
        $this->db->where('student.college_id', $college_id);
        $this->db->where('student.grade', $grade);
        $query = $this->db->get();
        return $query->result();
    }

    //获取学生的政治思想获奖信息
    public function student_political_prize_information($s_id)
    {
        $sql = "select * from prize_get where (u_id = $s_id and i_id in (select id from items where pid in (select id from items where pid = 1)))";
        $query = $this->db->query($sql);
        return $query->result();
    }

    //获取学生的智能素质获奖信息
    public function student_intelligence_prize_information($s_id)
    {
        $sql = "select * from prize_get where (u_id = $s_id and i_id in (select id from items where pid in (select id from items where pid = 2)))";
        $query = $this->db->query($sql);
        return $query->result();
    }

    //获取学生的能力发展获奖信息
    public function student_ability_prize_information($s_id)
    {
        $sql = "select * from prize_get where (u_id = $s_id and i_id in (select id from items where pid in (select id from items where pid = 3)))";
        $query = $this->db->query($sql);
        return $query->result();
    }

    // 根据学号、姓名、学期 查询获奖情况
    public function get_person_to_prize($num, $name, $term)
    {
        $sql = "select * from prize_confirm c, student s where c.u_id=s.s_id ";
        if ($num != "") {
            $sql .= " and s.s_num like '%$num%' ";
        }
        if ($name != "") {
            $sql .= " and c.u_name like '%$name%' ";
        }
        if ($term != "") {
            $sql .= " and c.add_time like '%$term%' ";
        }
        $query = $this->db->query($sql);
        return $query->result();
    }

    // 奖查人
    public function get_prize_to_person($college, $grade, $major, $clazz, $prize, $term)
    {
        $sql = "select *  from prize_confirm p, student s, college c, class cl where p.u_id=s.s_id and s.class_id=cl.id and cl.p_id=c.c_id ";
        if ($grade != "") {
            $sql .= " and cl.grade=$grade";
        }
        if ($clazz != "") {
            $sql .= " and cl.id=$clazz";
        }
        if ($major != "") {//根据专业查询
            $sql .= " and  c.c_id=$major ";
        }
        if ($term != "") {
            $sql .= " and p.add_time='$term'";
        }
        if ($prize != "") {
            $sql .= " and p.i_name='$prize'";
        }
        $query = $this->db->query($sql);
        return $query->result();

    }


//select *  from prize_get p, student s, college c, class cl
//where p.u_id=s.s_id
//and s.class_id=cl.id and cl.p_id=c.c_id
//and cl.grade=2017
//
//and cl.class_name='1班'
//and c.c_id=11
//and p.get_time='2017年秋期'
//and p.i_name="预备党员党课优秀学员"


}

?>