<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'modules/customer.php');

// Check if we have a customer_id
if($customer_id == '') {
    force_page('customer', 'search', 'warning_msg='.gettext("No Customer ID supplied."));
    exit;
}

// Insert the customer note
if(isset($VAR['submit'])) {   
    
    insert_customer_note($db, $customer_id, $VAR['note']);    
    force_page('customer', 'details&customer_id='.$customer_id);    

// Build the page  
} else {  

    $BuildPage .= $smarty->fetch('customer/note_new.tpl');

}

