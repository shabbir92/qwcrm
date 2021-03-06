<!-- open.tpl -->
{*
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
*}
<table width="100%" border="0" cellpadding="20" cellspacing="5">
    <tr>
        <td>
            <table width="700" cellpadding="4" cellspacing="0" border="0" >
                <tr>
                    <td class="menuhead2" width="80%">&nbsp;{t}Open Work Orders{/t} - {$total_results} {t}records found.{/t}</td>
                    <td class="menuhead2" width="20%" align="right" valign="middle">
                        <a>
                            <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}WORKORDER_OPEN_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}WORKORDER_OPEN_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="menutd2" colspan="2">
                        <table class="olotable" width="100%" border="0" cellpadding="5" cellspacing="0">
                            <tr>
                                <td class="menutd">                                 
                                    <table class="menutable" width="100%" border="0" cellpadding="5" cellspacing="0">
                                        <tr>
                                            
                                            <!-- Navigation -->
                                            <td valign="top" nowrap align="right">
                                                <form id="navigation">                                                    
                                                    <table>
                                                        <tr>
                                                            
                                                            <!-- Left buttons -->
                                                            <td>                                                                
                                                                <a href="index.php?page=workorder:open&search_category={$search_category}&search_term={$search_term}&page_no=1"><img src="{$theme_images_dir}rewnd_24.gif" border="0" alt=""></a>&nbsp;                                                    
                                                                <a href="index.php?page=workorder:open&search_category={$search_category}&search_term={$search_term}&page_no={$previous}"><img src="{$theme_images_dir}back_24.gif" border="0" alt=""></a>&nbsp;
                                                            </td>                                                   
                                                    
                                                            <!-- Dropdown Menu -->
                                                            <td>                                                                    
                                                                <select id="changeThisPage" onChange="changePage();">
                                                                    {section name=page loop=$total_pages start=1}
                                                                        <option value="index.php?page=workorder:open&search_category={$search_category}&search_term={$search_term}&page_no={$smarty.section.page.index}" {if $page_no == $smarty.section.page.index } Selected {/if}>
                                                                            {t}Page{/t} {$smarty.section.page.index} {t}of{/t} {$total_pages} 
                                                                        </option>
                                                                    {/section}
                                                                    <option value="index.php?page=workorder:open&search_category={$search_category}&search_term={$search_term}&page_no={$total_pages}" {if $page_no == $total_pages} selected {/if}>
                                                                        {t}Page{/t} {$total_pages} {t}of{/t} {$total_pages}
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            
                                                            <!-- Right Side Buttons --> 
                                                            <td>
                                                                <a href="index.php?page=workorder:open&search_category={$search_category}&search_term={$search_term}&page_no={$next}"><img src="{$theme_images_dir}forwd_24.gif" border="0" alt=""></a>                                                   
                                                                <a href="index.php?page=workorder:open&search_category={$search_category}&search_term={$search_term}&page_no={$total_pages}"><img src="{$theme_images_dir}fastf_24.gif" border="0" alt=""></a>
                                                            </td>                                                                                             
                                                    
                                                        </tr>
                                                        <tr>

                                                            <!-- Page Number Display -->
                                                            <td></td>
                                                            <td>
                                                                <p style="text-align: center;">{$total_results} {t}records found.{/t}</p>
                                                            </td>
                                                            
                                                        </tr>                                                    
                                                    </table>                                                    
                                                </form>                                                
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td valign="top" colspan="2">
                                                <table class="olotable" width="100%" border="0" cellpadding="4" cellspacing="0">
                                                    <tr>
                                                        <td class="olohead"><b>{t}WO ID{/t}</b></td>
                                                        <td class="olohead"><b>{t}INV ID{/t}</b></td>
                                                        <td class="olohead"><b>{t}Opened{/t}</b></td>
                                                        <td class="olohead"><b>{t}Closed{/t}</b></td>
                                                        <td class="olohead"><b>{t}Customer{/t}</b></td>
                                                        <td class="olohead"><b>{t}Scope{/t}</b></td>
                                                        <td class="olohead"><b>{t}Status{/t}</b></td>
                                                        <td class="olohead"><b>{t}Technician{/t}</b></td>
                                                    </tr>
                                                    {section name=i loop=$workorders}                                                    
                                                        {if $workorders[i].workorder_id != ''}
                                                            <tr onmouseover="this.className='row2';" onmouseout="this.className='row1';" onDblClick="window.location='index.php?page=workorder:details&workorder_id={$workorders[i].workorder_id}';" class="row1">
                                                                
                                                                <!-- WO ID -->
                                                                <td class="olotd4"><a href="index.php?page=workorder:details&workorder_id={$workorders[i].workorder_id}">{$workorders[i].workorder_id}</a></td>
                                                                
                                                                <!-- INV ID -->
                                                                <td class="olotd4"><a href="index.php?page=invoice:details&invoice_id={$workorders[i].invoice_id}">{$workorders[i].invoice_id}</a></td>
                                                                
                                                                <!-- Opened -->
                                                                <td class="olotd4"> {$workorders[i].workorder_open_date|date_format:$date_format}</td>
                                                                
                                                                <!-- Closed -->
                                                                <td class="olotd4">{$workorders[i].workorder_close_date|date_format:$date_format}</td>
                                                                
                                                                <!-- Customer -->
                                                                <td class="olotd4" nowrap>
                                                                    <img src="{$theme_images_dir}icons/16x16/view.gif" border="0" onMouseOver="ddrivetip('<b><center>{t}Customer Info{/t}</b></center><hr><b>{t}Contact{/t}:</b> {$workorders[i].customer_first_name} {$workorders[i].customer_last_name}<br><b>{t}Phone{/t}: </b>{$workorders[i].customer_phone}<br><b>{t}Mobile{/t}: </b>{$workorders[i].customer_mobile_phone}<br><b>{t}Fax{/t}: </b>{$workorders[i].customer_phone}<br><b>{t}Address{/t}: </b><br>{$workorders[i].customer_address|nl2br|regex_replace:"/[\r\t\n]/":" "}<br>{$workorders[i].customer_city}<br>{$workorders[i].customer_state}<br>{$workorders[i].customer_zip}<br>{$workorders[i].customer_country}');" onMouseOut="hideddrivetip();">
                                                                    <a class="link1" href="index.php?page=customer:details&customer_id={$workorders[i].customer_id}">{$workorders[i].customer_display_name}</a>
                                                                </td>
                                                                
                                                                <!-- Scope -->
                                                                <td class="olotd4" nowrap>{$workorders[i].workorder_scope}</td>
                                                                
                                                                <!-- Status -->
                                                                <td class="olotd4" align="center">
                                                                    {section name=s loop=$workorder_statuses}    
                                                                        {if $workorders[i].workorder_status == $workorder_statuses[s].status_key}{t}{$workorder_statuses[s].display_name}{/t}{/if}        
                                                                    {/section}                                                                     
                                                                </td>
                                                                
                                                                <!-- Employee -->
                                                                <td class="olotd4" nowrap>
                                                                    <img src="{$theme_images_dir}icons/16x16/view.gif" border="0" onMouseOver="ddrivetip('<center><b>{t}Technician Info{/t}</b></center><hr><b>{t}Employee{/t}: </b>{$workorders[i].employee_display_name}<br><b>{t}Mobile{/t}: </b>{$workorders[i].employee_work_mobile_phone}<br><b>{t}Home{/t}: </b>{$workorders[i].employee_home_primary_phone}<br><b>{t}Email{/t}: </b>{$workorders[i].employee_email}');" onMouseOut="hideddrivetip();">
                                                                    <a class="link1" href="index.php?page=user:details&user_id={$workorders[i].employee_id}">{$workorders[i].employee_display_name}</a>
                                                                </td>
                                                                
                                                            </tr>
                                                        {else}
                                                            <tr>
                                                                <td colspan="6" class="error">{t}There are no open work orders.{/t}</td>
                                                            </tr>
                                                        {/if}
                                                    {/section}
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>