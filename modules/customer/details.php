<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'modules/customer.php');
require(INCLUDES_DIR.'modules/invoice.php');
require(INCLUDES_DIR.'modules/giftcert.php');
require(INCLUDES_DIR.'modules/user.php');
require(INCLUDES_DIR.'modules/workorder.php');


// Check if we have a customer_id
if($customer_id == '') {
    force_page('customer', 'search', 'warning_msg='.gettext("No Customer ID supplied."));
    exit;
}

// Build the page
$smarty->assign('customer_types',       get_customer_types($db)                                                                             );
$smarty->assign('customer_details',     get_customer_details($db, $customer_id)                                                             );

$smarty->assign('workorder_statuses',   get_workorder_statuses($db)                                                                         );
$smarty->assign('open_workorders',      display_workorders($db, 'DESC', false, $page_no, '25', null, null, 'open', null, $customer_id)      );
$smarty->assign('closed_workorders',    display_workorders($db, 'DESC', false, $page_no, '25', null, null, 'closed', null, $customer_id)    );

$smarty->assign('unpaid_invoices',      display_invoices($db, 'DESC', false, $page_no, '25', null, null, '0', null, $customer_id)           );
$smarty->assign('paid_invoices',        display_invoices($db, 'DESC', false, $page_no, '25', null, null, '1', null, $customer_id)           );

$smarty->assign('active_giftcerts',     display_giftcerts($db, 'DESC', false, $page_no, '25', null, null, null, '0', null, $customer_id)    );
$smarty->assign('redeemed_giftcerts',   display_giftcerts($db, 'DESC', false, $page_no, '25', null, null, null, '1', null, $customer_id)    );

$smarty->assign('GoogleMapString',      build_googlemap_directions_string($db, $customer_id, $login_user_id)                                );
$smarty->assign('customer_notes',       get_customer_notes($db, $customer_id)                                                               );

$BuildPage .= $smarty->fetch('customer/details.tpl');