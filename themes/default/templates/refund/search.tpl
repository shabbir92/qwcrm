<!-- search.tpl -->
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
                    <td class="menuhead2" width="80%">&nbsp;&nbsp;{t}Search Refunds{/t}</td>
                    <td class="menuhead2" width="20%" align="right" valign="middle">
                        <a>
                            <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}REFUND_SEARCH_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}REFUND_SEARCH_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
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
                                            <!-- Category Search -->
                                            <td valign="top">
                                                <form method="post" action="index.php?page=refund:search" name="refund_search" id="refund_search" autocomplete="off">
                                                    <div>                                                       
                                                        <table border="0">
                                                            <tr>
                                                                <td align="left" valign="top"><b>{t}Refund Search{/t}</b>
                                                                    <br />
                                                                    <select class="olotd5" id="search_category" name="search_category">
                                                                        <option value="refund_id"{if $search_category == 'refund_id'} selected{/if}>{t}Refund ID{/t}</option>
                                                                        <option value="payee"{if $search_category == 'payee'} selected{/if}>{t}Payee{/t}</option>
                                                                        <option value="date"{if $search_category == 'date'} selected{/if}>{t}Date{/t}</option>
                                                                        <option value="type"{if $search_category == 'type'} selected{/if}>{t}Type{/t}</option>
                                                                        <option value="payment_method"{if $search_category == 'payment_method'} selected{/if}>{t}Payment Method{/t}</option>
                                                                        <option value="net_amount"{if $search_category == 'net_amount'} selected{/if}>{t}Net Amount{/t}</option>
                                                                        <option value="tax_rate"{if $search_category == 'tax_rate'} selected{/if}>{t}VAT Rate{/t}</option>
                                                                        <option value="tax_amount"{if $search_category == 'tax_amount'} selected{/if}>{t}VAT Amount{/t}</option>
                                                                        <option value="gross_amount"{if $search_category == 'gross_amount'} selected{/if}>{t}Gross{/t} ({t}Total{/t})</option>                                                                      
                                                                        <option value="items"{if $search_category == 'items'} selected{/if}>{t}Items{/t}</option>
                                                                        <option value="notes"{if $search_category == 'notes'} selected{/if}>{t}Notes{/t}</option>
                                                                    </select>
                                                                   <br />
                                                                   <b>{t}for{/t}</b>
                                                                   <br />
                                                                   <input class="olotd4" name="search_term" value="{$search_term}" type="text" maxlength="20" required onkeydown="return onlyAlphaNumeric(event);" />
                                                                   <input class="olotd4" name="submit" value="{t}Search{/t}" type="submit" />
                                                                   <input class="olotd4" type="button" value="{t}Reset{/t}" onclick="window.location.href='index.php?page=refund:search';" type="button">                                                                                      </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><font color="red">{t}NO special characters like !@#$%^*(){/t}</font></td>
                                                                </tr>
                                                        </table>
                                                    </div>
                                                </form>
                                            </td>                                                              
                                                                            
                                            <!-- Navigation -->
                                            <td valign="top" nowrap align="right">
                                                <form id="navigation">                                                    
                                                    <table>
                                                        <tr>
                                                            
                                                            <!-- Left buttons -->
                                                            <td>                                                                
                                                                <a href="index.php?page=refund:search&search_category={$search_category}&search_term={$search_term}&page_no=1"><img src="{$theme_images_dir}rewnd_24.gif" border="0" alt=""></a>&nbsp;                                                    
                                                                <a href="index.php?page=refund:search&search_category={$search_category}&search_term={$search_term}&page_no={$previous}"><img src="{$theme_images_dir}back_24.gif" border="0" alt=""></a>&nbsp;
                                                            </td>                                                   
                                                    
                                                            <!-- Dropdown Menu -->
                                                            <td>                                                                    
                                                                <select id="changeThisPage" onChange="changePage();">
                                                                    {section name=page loop=$total_pages start=1}
                                                                        <option value="index.php?page=refund:search&search_category={$search_category}&search_term={$search_term}&page_no={$smarty.section.page.index}" {if $page_no == $smarty.section.page.index } Selected {/if}>
                                                                            {t}Page{/t} {$smarty.section.page.index} {t}of{/t} {$total_pages} 
                                                                        </option>
                                                                    {/section}
                                                                    <option value="index.php?page=refund:search&search_category={$search_category}&search_term={$search_term}&page_no={$total_pages}" {if $page_no == $total_pages} selected {/if}>
                                                                        {t}Page{/t} {$total_pages} {t}of{/t} {$total_pages}
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            
                                                            <!-- Right Side Buttons --> 
                                                            <td>
                                                                <a href="index.php?page=refund:search&search_category={$search_category}&search_term={$search_term}&page_no={$next}"><img src="{$theme_images_dir}forwd_24.gif" border="0" alt=""></a>                                                   
                                                                <a href="index.php?page=refund:search&search_category={$search_category}&search_term={$search_term}&page_no={$total_pages}"><img src="{$theme_images_dir}fastf_24.gif" border="0" alt=""></a>
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
                                                <!-- Records Table -->
                                                <table class="olotable" width="100%" border="0" cellpadding="5" cellspacing="0">
                                                    <tr>
                                                        <td class="olohead">{t}Refund ID{/t}</td>
                                                        <td class="olohead">{t}Payee{/t}</td>
                                                        <td class="olohead">{t}Date{/t}</td>
                                                        <td class="olohead">{t}Type{/t}</td>
                                                        <td class="olohead">{t}Payment Method{/t}</td>
                                                        <td class="olohead">{t}Net Amount{/t}</td>
                                                        <td class="olohead">{t}VAT Rate{/t}</td>
                                                        <td class="olohead">{t}VAT Amount{/t}</td>
                                                        <td class="olohead">{t}Gross Amount{/t}</td>
                                                        <td class="olohead">{t}Notes{/t}</td>
                                                        <td class="olohead">{t}Items{/t}</td>
                                                        <td class="olohead">{t}Action{/t}</td>
                                                    </tr>
                                                    {section name=i loop=$search_result}                                                            
                                                        <!-- This allows double clicking on a row and opens the corresponding refund view details -->
                                                        <tr onmouseover="this.className='row2';" onmouseout="this.className='row1';" onDblClick="window.location='index.php?page=refund:details&refund_id={$search_result[i].refund_id}';" class="row1">                                                                
                                                            <td class="olotd4" nowrap><a href="index.php?page=refund:details&refund_id={$search_result[i].refund_id}">{$search_result[i].refund_id}</a></td>                                                                
                                                            <td class="olotd4" nowrap>{$search_result[i].payee}</td>                                                                
                                                            <td class="olotd4" nowrap>{$search_result[i].date|date_format:$date_format}</td>                                                                
                                                            <td class="olotd4" nowrap>
                                                                {section name=s loop=$refund_types}    
                                                                    {if $search_result[i].type == $refund_types[s].refund_type_id}{t}{$refund_types[s].display_name}{/t}{/if}        
                                                                {/section}   
                                                            </td>                                                                
                                                            <td class="olotd4" nowrap>
                                                                {section name=s loop=$payment_methods}    
                                                                    {if $search_result[i].payment_method == $payment_methods[s].manual_method_id}{t}{$payment_methods[s].display_name}{/t}{/if}        
                                                                {/section} 
                                                            </td>                                                               
                                                            <td class="olotd4" nowrap>{$currency_sym} {$search_result[i].net_amount}</td>                                                               
                                                            <td class="olotd4" nowrap>{$search_result[i].tax_rate} %</td>                                                                
                                                            <td class="olotd4" nowrap>{$currency_sym} {$search_result[i].tax_amount}</td>                                                            
                                                            <td class="olotd4" nowrap>{$currency_sym} {$search_result[i].gross_amount}</td>                                                                
                                                            <td class="olotd4" nowrap>{if $search_result[i].notes != ''}<img src="{$theme_images_dir}icons/16x16/view.gif" border="0" alt="" onMouseOver="ddrivetip('<div><b>{t}Notes{/t}</strong></div><hr><div>{$search_result[i].notes}</div>');" onMouseOut="hideddrivetip();">{/if}</td>                                                            
                                                            <td class="olotd4" nowrap><img src="{$theme_images_dir}icons/16x16/view.gif" border="0" alt="" onMouseOver="ddrivetip('<div><b>{t}Items{/t}</strong></div><hr><div>{$search_result[i].items}</div>');" onMouseOut="hideddrivetip();"></td>                                                                
                                                            <td class="olotd4" nowrap>
                                                                <a href="index.php?page=refund:details&refund_id={$search_result[i].refund_id}">
                                                                    <img src="{$theme_images_dir}icons/16x16/viewmag.gif" alt="" border="0" onMouseOver="ddrivetip('<b>{t}View Refund Details{/t}');" onMouseOut="hideddrivetip();">
                                                                </a>
                                                                <a href="index.php?page=refund:edit&refund_id={$search_result[i].refund_id}">
                                                                    <img src="{$theme_images_dir}icons/16x16/small_edit.gif" alt=""  border="0" onMouseOver="ddrivetip('<b>{t}Edit Refund Details{/t}</b>');" onMouseOut="hideddrivetip();">
                                                                </a>
                                                                <a href="index.php?page=refund:delete&refund_id={$search_result[i].refund_id}" onclick="return confirmChoice('{t}Are you Sure you want to delete this Refund Record? This will permanently remove the record from the database.{/t}');">
                                                                    <img src="{$theme_images_dir}icons/delete.gif" alt="" border="0" height="14" width="14" onMouseOver="ddrivetip('<b>{t}Delete Refund Record{/t}</b>');" onMouseOut="hideddrivetip();">
                                                                </a>
                                                            </td>
                                                        </tr>
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