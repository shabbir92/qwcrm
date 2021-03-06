<!-- details.tpl -->
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
                    <td class="menuhead2" width="80%">&nbsp;{t}Invoice For Work Order ID{/t} {$workorder_id}</td>
                    <td class="menuhead2" width="20%" align="right" valign="middle">
                        <a>
                            <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}INVOICE_DETAILS_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}INVOICE_DETAILS_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="menutd2" colspan="2">
                        <table class="olotable" width="100%" border="0" cellpadding="5" cellspacing="0">
                            <tr>
                                <td class="menutd">                                   
                                    
                                    <table width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                        
                                        <!-- Invoice Information -->
                                        <tr class="olotd4">
                                            <td class="row2"><b>{t}Invoice ID{/t}</b></td>
                                            <td class="row2"><b>{t}Work Order{/t}</b></td>
                                            <td class="row2"><b>{t}Technician{/t}</b></td> 
                                            <td class="row2"><b>{t}Date{/t}</b></td>
                                            <td class="row2"><b>{t}Due Date{/t}</b></td>                                                                                                                                 
                                            <td class="row2"><b>{t}Status{/t}</b></td>
                                            <td class="row2"><b>{t}Amount Paid{/t}</b></td>
                                            <td class="row2"><b>{t}Balance{/t}</b></td>
                                            <td class="row2"><b>{t}Date Paid{/t}</b></td>
                                        </tr>
                                        <tr class="olotd4">
                                            <td>{$invoice_id}</td>
                                            <td>
                                                {if $workorder_id > 0}
                                                    <a href="index.php?page=workorder:details&workorder_id={$invoice_details.workorder_id}">{$invoice_details.workorder_id}</a>
                                                {else}
                                                    {t}n/a{/t}
                                                {/if}
                                            </td>
                                            <td><a href="index.php?page=user:details&user_id={$invoice_details.employee_id}">{$employee_display_name}</a></td>                                            
                                            <td>{$invoice_details.date|date_format:$date_format}</td>                                            
                                            <td>{$invoice_details.due_date|date_format:$date_format}</td>
                                            <td>
                                                {section name=s loop=$invoice_statuses}    
                                                    {if $invoice_details.status == $invoice_statuses[s].status_key}{t}{$invoice_statuses[s].display_name}{/t}{/if}        
                                                {/section}              
                                            </td>
                                            <td>{$currency_sym}{$invoice_details.paid_amount|string_format:"%.2f"}</td>
                                            <td><font color="#cc0000">{$currency_sym}{$invoice_details.balance|string_format:"%.2f"}</font></td>
                                            <td>{$invoice_details.paid_date|date_format:$date_format}</td>
                                        </tr>
                                        
                                        <!-- Scope -->
                                        <tr class="olotd4">
                                            <td colspan="2"><b>{t}Work Order Scope{/t}:</b></td>
                                            <td>{if $workorder_details.scope}{$workorder_details.scope}{else}{t}n/a{/t}{/if}</td>
                                        </tr>

                                        <tr>

                                            <!-- Customer Details -->
                                            <td colspan="6" valign="top" align="left">
                                                <b>{t}Bill{/t}</b>                                                        
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td valign="top">
                                                            <a href="index.php?page=customer:details&customer_id={$customer_details.customer_id}">{$customer_details.display_name}</a><br>
                                                            {$customer_details.address|nl2br}<br>
                                                            {$customer_details.city}<br>
                                                            {$customer_details.state}<br>
                                                            {$customer_details.zip}<br>
                                                            {$customer_details.country}<br>
                                                            {$customer_details.primary_phone}<br>
                                                            {$customer_details.email}                                                                        
                                                        </td>
                                                    </tr>
                                                </table>                                                        
                                            </td>

                                            <!-- Company Details -->
                                            <td colspan="3" valign="top" >
                                                <b>{t}Pay To{/t}</b>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td valign="top">                                                                    
                                                            {$company_details.display_name}<br>
                                                            {$company_details.address|nl2br|regex_replace:"/[\r\t\n]/":" "}<br>
                                                            {$company_details.city}<br>
                                                            {$company_details.state}<br>
                                                            {$company_details.zip}<br>
                                                            {$company_details.country}<br>                                                                                                                             
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>

                                        <!-- Terms and Discount -->
                                        <tr>
                                            <td colspan="9" valign="top" align="left">                                                        
                                                <b>{t}TERMS{/t}:</b> {$customer_details.credit_terms}<br>
                                                <b>{t}Customer Discount Rate{/t}:</b>
                                                {$invoice_details.discount_rate|string_format:"%.2f"} %                                                                                                     
                                            </td>
                                        </tr>

                                    </table>                                                         
                                    <br>                                            

                                    <!-- if invoice has an amount -->
                                    {if $invoice_details.gross_amount > 0 }

                                        <!-- Function Buttons -->
                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" id="transaction_log">
                                            <tr>
                                                <td class="menuhead2">&nbsp;{t}Function Buttons{/t}</td>
                                            </tr>
                                            <tr>
                                                <td class="menutd2">

                                                    <!-- Print Buttons -->   
                                                    <button type="button" onClick="window.open('index.php?page=invoice:print&invoice_id={$invoice_details.invoice_id}&print_type=print_html&print_content=invoice&theme=print');">{t}Print HTML{/t}</button>
                                                    <button type="button" onClick="window.open('index.php?page=invoice:print&invoice_id={$invoice_details.invoice_id}&print_type=print_pdf&print_content=invoice&theme=print');"><img src="{$theme_images_dir}icons/pdf_small.png"  height="14" alt="pdf">{t}Print PDF{/t}</button>
                                                    <button type="button" onClick="confirmChoice('Are you sure you want to email this invoice to the customer?') && $.ajax( { url:'index.php?page=invoice:print&invoice_id={$invoice_details.invoice_id}&print_type=email_pdf&print_content=invoice&theme=print', success: function(data) { $('body').append(data); } } );"><img src="{$theme_images_dir}icons/pdf_small.png"  height="14" alt="pdf">{t}Email PDF{/t}</button>
                                                    <button type="button" onClick="window.open('index.php?page=invoice:print&invoice_id={$invoice_details.invoice_id}&print_type=print_html&print_content=customer_envelope&theme=print');">{t}Print Customer Envelope{/t}</button>                                            

                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                        
                                    {/if} 

                                    <!-- Transaction Log -->
                                    {if $transactions != null}                                            
                                        <table width="100%" cellpadding="4" cellspacing="0" border="0" id="transaction_log">
                                            <tr>
                                                <td class="menuhead2">&nbsp;{t}Transaction Log{/t}</td>
                                            </tr>
                                            <tr>
                                                <td class="menutd2">
                                                    <table width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                                        <tr class="olotd4">
                                                            <td class="row2"><b>{t}Transaction ID{/t}</b></td>
                                                            <td class="row2"><b>{t}Date{/t}</b></td>
                                                            <td class="row2"><b>{t}Amount{/t}</b></td>
                                                            <td class="row2"><b>{t}Method{/t}</b></td>
                                                        </tr>                                                            
                                                        {section name=t loop=$transactions}
                                                            <tr class="olotd4">
                                                                <td>{$transactions[t].transaction_id}</td>
                                                                <td>{$transactions[t].date|date_format:$date_format}</td>
                                                                <td><b>{$currency_symbol}</b>{$transactions[t].amount|string_format:"%.2f"}</td>
                                                                <td>
                                                                    {section name=s loop=$invoice_statuses}
                                                                        {if $invoice_details.status == $invoice_statuses[s].status_key}{t}{$invoice_statuses[s].display_name}{/t}{/if}        
                                                                    {/section} 
                                                                </td> 
                                                            </tr>
                                                            <tr class="olotd4">
                                                                <td><b>{t}Note{/t}</b></td>
                                                                <td colspan="3">{$transactions[t].note}</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="row2" colspan="4">&nbsp;</td>
                                                            </tr>
                                                        {/section}
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                    {/if}                                            

                                    <!-- Labour Items -->
                                    <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2">&nbsp;{t}Labour{/t}</td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2">
                                                {if $labour_items != '0'}
                                                    <table width="100%" cellpadding="3" cellspacing="0" border="0" class="olotable">
                                                        <tr  class="olotd4">
                                                            <td class="row2"><b>{t}No{/t}</b></td>
                                                            <td class="row2" width="12"><b>{t}Qty{/t}</b></td>
                                                            <td class="row2"><b>{t}Description{/t}</b></td>
                                                            <td class="row2"><b>{t}Price{/t}</b></td>
                                                            <td class="row2"><b>{t}Total{/t}</b></td>
                                                            <td class="row2"><b>{t}Actions{/t}</b></td>
                                                        </tr>
                                                        {section name=l loop=$labour_items}
                                                            <tr class="olotd4">
                                                                <td>{$smarty.section.q.index+1}</td>
                                                                <td>{$labour_items[l].qty}</td>
                                                                <td>{$labour_items[l].description}</td>
                                                                <td>{$currency_sym}{$labour_items[l].amount|string_format:"%.2f"}</td>
                                                                <td>{$currency_sym}{$labour_items[l].sub_total|string_format:"%.2f"}</td>
                                                                <td>-</td>
                                                            </tr>
                                                        {/section}
                                                        <tr>
                                                            <td colspan="5" style="text-align:right;"><b>{t}Labour Total{/t}</b></td>
                                                            <td style="text-align:left;">{$currency_sym}{$labour_sub_total|string_format:"%.2f"}</td>
                                                        </tr>
                                                    </table>
                                                {/if}
                                                <br>
                                            </td>
                                        </tr>
                                    </table>
                                    <br>

                                    <!-- Parts Items -->
                                    <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2">&nbsp;{t}Parts{/t}</td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2">
                                                {if $parts_items != '0'}
                                                    <table width="100%" cellpadding="4" cellspacing="0" border="0" class="olotable">
                                                        <tr class="olotd4">
                                                            <td class="row2"><b>{t}No{/t}</b></td>
                                                            <td class="row2"><b>{t}Count{/t}</b></td>
                                                            <td class="row2"><b>{t}Description{/t}</b></td>
                                                            <td class="row2"><b>{t}Price{/t}</b></td>
                                                            <td class="row2"><b>{t}Total{/t}</b></td>
                                                            <td class="row2"><b>{t}Actions{/t}</b></td>
                                                        </tr>
                                                        {section name=p loop=$parts_items}
                                                            <tr class="olotd4">
                                                                <td>{$smarty.section.w.index+1}</td>
                                                                <td>{$parts_items[p].qty}</td>
                                                                <td>{$parts_items[p].description}</td>
                                                                <td>{$currency_sym}{$parts_items[p].amount|string_format:"%.2f"}</td>
                                                                <td>{$currency_sym}{$parts_items[p].sub_total|string_format:"%.2f"}</td>
                                                                <td>-</td>
                                                            </tr>
                                                         {/section}
                                                        <tr>
                                                            <td colspan="5" style="text-align:right;"><b>{t}Parts Total{/t}</b></td>
                                                            <td style="text-align:left;">{$currency_sym}{$parts_sub_total|string_format:"%.2f"}</td>
                                                        </tr>
                                                    </table>
                                                {/if}                                                
                                            </td>
                                        </tr>
                                    </table>
                                    <br>

                                    <!-- Totals Section -->
                                    <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2">&nbsp;{t}Invoice Total{/t}</td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2">
                                                <table width="100%" border="1" cellpadding="3" cellspacing="0" class="olotable">
                                                    <tr>
                                                        <td class="olotd4" width="80%" align="right"><b>{t}Sub Total{/t}</b></td>
                                                        <td class="olotd4" width="20%" align="right">{$currency_sym}{$invoice_details.sub_total|string_format:"%.2f"}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="olotd4" width="80%" align="right"><b>{t}Discount{/t} (@ {$invoice_details.discount_rate|string_format:"%.2f"}%)</b></td>
                                                        <td class="olotd4" width="20%" align="right">- {$currency_sym}{$invoice_details.discount_amount|string_format:"%.2f"}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="olotd4" width="80%" align="right"><b>{t}Net{/t}</b></td>
                                                        <td class="olotd4" width="20%" align="right">{$currency_sym}{$invoice_details.net_amount|string_format:"%.2f"}</td>
                                                    </tr>
                                                    <tr>                                                            
                                                        <td class="olotd4" width="80%" align="right"><b>{t}VAT{/t} (@ {$invoice_details.tax_rate}%)</b></td>
                                                        <td class="olotd4" width="20%" align="right">{$currency_sym}{$invoice_details.tax_amount|string_format:"%.2f"}</td>                                                            
                                                    </tr>
                                                    <tr>
                                                        <td class="olotd4" width="80%" align="right"><b>{t}Gross{/t} ({t}Total{/t})</b></td>
                                                        <td class="olotd4" width="20%" align="right">{$currency_sym}{$invoice_details.gross_amount|string_format:"%.2f"}</td>
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
        </td>
    </tr>
</table>