<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	function insert_log_data($id,$do,$genre){

        date_default_timezone_set('PRC');
		$data = array(
                'u_id'=>$id,'do'=>$do,
                'time'=>date('Y-m-d H:i:s'),'genre'=>$genre
            );
		$CI = & get_instance();
		$CI->load->model('log_model');
		$CI->log_model->add_record($data);
	}


	
	





