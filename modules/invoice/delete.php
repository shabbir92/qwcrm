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
require(INCLUDES_DIR.'modules/workorder.php');

// Prevent direct access to this page
if(!check_page_accessed_via_qwcrm()) {
    die(gettext("No Direct Access Allowed."));
}

// Check if we have an invoice_id
if($invoice_id == '') {
    force_page('invoice', 'search', 'warning_msg='.gettext("No Invoice ID supplied."));
    exit;
}



// Delete Invoice
if(!delete_invoice($db, $invoice_id)) {    
    
    // Load the invoice details page with error
    force_page('invoice', 'details&invoice_id='.$invoice_id);
    exit;
    
    
} else {   
    
    // load the work order invoice page
    force_page('invoice', 'search', 'information_msg='.gettext("The invoice has been deleted successfully."));
    exit;
    
}