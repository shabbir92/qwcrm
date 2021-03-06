<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'modules/schedule.php');
require(INCLUDES_DIR.'modules/user.php');

// Check if we have a schedule_id
if($schedule_id == '') {
    force_page('schedule', 'search', 'warning_msg='.gettext("No Schedule ID supplied."));
    exit;
}

// If new schedule item submitted
if(isset($VAR['submit'])) {    
    
    // If db insert fails send them an error and reload the page with submitted info or load the page with the schedule
    if (!update_schedule($db, $VAR['start_date'], $VAR['StartTime'], $VAR['end_date'], $VAR['EndTime'], $VAR['notes'], $schedule_id, $employee_id, $customer_id, $workorder_id)) {        
        
        $smarty->assign('start_date',       $VAR['start_date']                                                  );       
        $smarty->assign('start_time',       $VAR['StartTime']['Time_Hour'].":".$VAR['StartTime']['Time_Minute'] );                
        $smarty->assign('end_date',         $VAR['end_date']                                                    );        
        $smarty->assign('end_time',         $VAR['EndTime']['Time_Hour'].":".$VAR['EndTime']['Time_Minute']     );
        $smarty->assign('notes',            $VAR['notes']                                                       );        
        $smarty->assign('active_employees', get_active_users($db, 'employees')                                  );                      
            
    } else {       
        
        // Load the schedule day with the updated schedule item        
        $start_year            = date('Y', date_to_timestamp($VAR['start_date'])  );
        $start_month           = date('m', date_to_timestamp($VAR['start_date'])  );
        $start_day             = date('d', date_to_timestamp($VAR['start_date'])  );    
    
        // Load the schedule day with the updated schedule item
        force_page('schedule', 'day', 'start_year='.$start_year.'&start_month='.$start_month.'&start_day='.$start_day.'&employee_id='.$employee_id.'&workorder_id='.$workorder_id.'&information_msg='.gettext("Schedule Successfully Updated"));
        exit;
        
    }

// If edit schedule form is loaded, get schedule item from the database and assign
} else {
    
    // Get the Schedule Record
    $schedule_item = get_schedule_details($db, $schedule_id);
    
    // Corrects the extra time segment issue    
    $end_time = $schedule_item['schedule_end'] + 1;
    
    //$smarty->assign('schedule_id',      $schedule_item['schedule_id']                           );
    $smarty->assign('employee_id',      $schedule_item['employee_id']                           );    
    $smarty->assign('customer_id',      $schedule_item['customer_id']                           );
    $smarty->assign('workorder_id',     $schedule_item['workorder_id']                          );
    $smarty->assign('start_date',       timestamp_to_date($schedule_item['schedule_start'])     );       
    $smarty->assign('start_time',       date('H:i', $schedule_item['schedule_start'])           );         
    $smarty->assign('end_date',         timestamp_to_date($schedule_item['schedule_end'])       );         
    $smarty->assign('end_time',         date('H:i', $end_time)                                  );   
    $smarty->assign('notes',            $schedule_item['notes']                                 );
    $smarty->assign('active_employees', get_active_users($db, 'employees')                      );
    
}

// Build the page
$BuildPage .= $smarty->fetch('schedule/edit.tpl');