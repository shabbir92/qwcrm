<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require_once(INCLUDES_DIR.'modules/core_menu.php');
 
// Get Workorder Status if we have a workorder_id
if($workorder_id != '') {
    $smarty->assign('menu_workorder_is_closed', menu_get_single_workorder_is_closed($db, $workorder_id));
}

// Display menu block
$BuildPage .= $smarty->fetch('core/blocks/theme_menu_block.tpl');