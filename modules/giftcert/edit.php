<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'modules/customer.php');
require(INCLUDES_DIR.'modules/giftcert.php');
require(INCLUDES_DIR.'modules/payment.php');

// Check if we have an giftcert_id
if($giftcert_id == '') {
    force_page('giftcert', 'search', 'warning_msg='.gettext("No Gift Certificate ID supplied."));
    exit;
}

// Check if giftcert payment method is enabled
if(!check_payment_method_is_active($db, 'gift_certificate_active')) {
    force_page('core', 'dashboard','warning_msg='.gettext("Gift Certificate payment method is not enabled. To enable Gift Certificates go to the Help menu and select Control Center. Then under the menu Billing Options select Payment Methods and check Gift Certificate."));
    exit;
}

// Check if giftcert redeemed - if so, it cannot be updated
if(check_giftcert_redeemed($db, $giftcert_id)) {
    force_page('giftcert', 'details&giftcert_id='.$giftcert_id, 'warning_msg='.gettext("You cannot edit this Gift Certificate because it has been redeemed."));
    exit;
}

// if information submitted
if(isset($VAR['submit'])) {
    
    // Create a new gift certificate
    update_giftcert($db, $giftcert_id, date_to_timestamp($VAR['date_expires']), $VAR['amount'], $VAR['status'], $VAR['notes']);

    // Load the new Gift Certificate's Details page
    force_page('giftcert', 'details&giftcert_id='.$giftcert_id);    

} else {
    
    // Build the page    
    $smarty->assign('customer_details', get_customer_details($db, get_giftcert_details($db, $giftcert_id, 'customer_id')));    
    $smarty->assign('giftcert_details', get_giftcert_details($db, $giftcert_id));
    $BuildPage .= $smarty->fetch('giftcert/edit.tpl');
}