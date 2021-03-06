<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'modules/customer.php');
require(INCLUDES_DIR.'modules/schedule.php');
require(INCLUDES_DIR.'modules/workorder.php');

// Check if we have a schedule_id or output is set to day
if($schedule_id == '' && !$VAR['ics_type'] == 'day') {    
    force_page('schedule', 'search', 'warning_msg='.gettext("Output type or Schedule ID is missing."));
    exit;
}

// Check if we have all of the date information
if($start_year == '' || $start_month == '' || $start_day == '') {
    force_page('user', 'search', 'warning_msg='.gettext("Some date information is missing."));
    exit;
}

// Add routines here to decide what is returned ie multi schedule, single schedule or a live calendar 

// Set the filename
if($VAR['ics_type'] == 'day') {
    $filename = 'EmployeeID-'.$employee_id.'-Date-'.$start_year.$start_month.$start_day.'.ics';
} else {
    //$filename   = str_replace(' ', '_', $customer_details['display_name']).'-Workorder-'.$single_schedule['workorder_id'].'-Schedule-'.$schedule_id.'.ics';
    $filename   = 'schedule.ics';    
}

// Set the correct headers for this file
header('Content-type: text/calendar; charset=utf-8');
header('Content-Disposition: attachment; filename=' . $filename);

// Output the .ics file

// Build Schedule day for employee as an .ics
if($VAR['ics_type'] == 'day') {
    echo build_ics_schedule_day($db, $employee_id, $start_year, $start_month, $start_day);
    
// Output just the single schedule item as an .ics
} else {
    echo build_single_schedule_ics($db, $schedule_id);
}
