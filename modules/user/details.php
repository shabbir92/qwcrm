<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'modules/customer.php');
require(INCLUDES_DIR.'modules/user.php');
require(INCLUDES_DIR.'modules/workorder.php');

// Check if we have an user_id
if($user_id == '') {
    force_page('user', 'search', 'warning_msg='.gettext("No User ID supplied."));
    exit;
}

// Build the page
$smarty->assign('open_workorders', display_workorders($db, 'DESC', false, $page_no, '25', null, null, 'open', $user_id)                     );
$smarty->assign('user_details', get_user_details($db, $user_id)                                                                             );
$smarty->assign('customer_display_name', get_customer_details($db, get_user_details($db, $user_id, 'customer_id'), 'customer_display_name') );
$smarty->assign('usergroups', get_usergroups($db)                                                                                           );
$BuildPage .= $smarty->fetch('user/details.tpl');