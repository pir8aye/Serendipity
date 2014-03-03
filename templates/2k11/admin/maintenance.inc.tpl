<div id="maintenance" class="clearfix">
    <h2>{$CONST.MAINTAIN_TITLE}</h2>

{if $action == "integrity"}
    <div class="clearfix">
        <h3 class="visuallyhidden">{$CONST.INTEGRITY}</h3>
    {if $noChecksum == true}
        <span class="msg_notice"><span class="icon-info-circled"></span>{$CONST.CHECKSUMS_NOT_FOUND}</span>
    {else}
        {if $badsums|count == 0}
        <span class="msg_success"><span class="icon-ok-circled"></span>{$CONST.CHECKSUMS_PASS}</span>
        {else}
        <ul class="plainList">
            {foreach $badsums as $rpath => $calcsum}
            <li class="msg_error"><span class="icon-attention-circled"></span>{$CONST.CHECKSUM_FAILED|sprintf:$rpath}</li>
            {/foreach}
        </ul>
        {/if}
    {/if}
    </div>
{/if}

{if $cct_finish === true}
        <span class="msg_success"><span class="icon-ok-circled"></span>{$CONST.DONE}! {$CONST.MAINTAIN_CCT_PASS}</span>
{/if}
{if $cct_finish === false}
        <span class="msg_error"><span class="icon-attention-circled"></span>{$CONST.MAINTAIN_CCT_FAIL|sprintf:$CONST.MAINTAIN_CCT_PASS}</span>
{/if}

{if 'siteConfiguration'|checkPermission || 'blogConfiguration'|checkPermission}
    <section id="maintenance_integrity" class="equal_heights quick_list">
        <h3>{$CONST.INTEGRITY}</h3>

        <a class="button_link" href="?serendipity[action]=admin&amp;serendipity[adminModule]=maintenance&amp;serendipity[adminAction]=integrity" title="{$CONST.INTEGRITY}"><span>{$CONST.INTEGRITY}</span></a>
    </section>
{/if}

{if 'adminTemplates'|checkPermission}
    <section id="maintenance_cleanup" class="equal_heights quick_list">
        <h3>{$CONST.MAINTAIN_CCT_TITLE}</h3>

        <a class="button_link" href="?serendipity[action]=admin&amp;serendipity[adminModule]=maintenance&amp;serendipity[adminAction]=cct" title="{$CONST.MAINTAIN_CCT_TITLE}"><span>{$CONST.MAINTAIN_CCT_TITLE}</span></a>
        <button class="toggle_info button_link" type="button" data-href="#cct_info"><span class="icon-info-circled"></span><span class="visuallyhidden"> More</span></button>
        <span id="cct_info" class="comment_status additional_info">{$CONST.MAINTAIN_CCT_INFO}</span>
    </section>
{/if}

{serendipity_hookPlugin hook="backend_maintenance" hookAll="true"}

{if 'adminImport'|checkPermission}
    <section id="maintenance_export" class="equal_heights quick_list">
        <h3>{$CONST.EXPORT_ENTRIES}</h3>

        <a class="button_link" href="{$serendipityBaseURL}rss.php?version=2.0&amp;all=1"><span class="icon-rss"></span> {$CONST.EXPORT_FEED}</a>
    </section>

    <section id="maintenance_import" class="equal_heights quick_list">
        <h3>{$CONST.IMPORT_ENTRIES}</h3>
    
        {$importMenu}
    </section>
{/if}

{if 'adminImagesSync'|checkPermission}
    <section id="maintenance_thumbs" class="quick_list">
        <h3>{$CONST.CREATE_THUMBS}</h3>

        <span class="msg_notice"><span class="icon-info-circled"></span> {$CONST.WARNING_THIS_BLAHBLAH|replace:'\\n':'<br>'}</span>

        <form method="POST" action="serendipity_admin.php?serendipity[adminModule]=media&amp;serendipity[adminAction]=doSync">
            <fieldset>
                <span class="wrap_legend"><legend>{$CONST.SYNC_OPTION_LEGEND}</legend></span>

                <div class="clearfix">
                    <div class="form_radio">
                        <input id="keepthumbs" name="serendipity[deleteThumbs]" type="radio" value="no" checked="checked">
                        <label for="keepthumbs">{$CONST.SYNC_OPTION_KEEPTHUMBS}</label>
                    </div>

                    <div class="form_radio">
                        <input id="sizecheckthumbs" name="serendipity[deleteThumbs]" type="radio" value="check">
                        <label for="sizecheckthumbs">{$CONST.SYNC_OPTION_SIZECHECKTHUMBS}</label>
                    </div>
                    
                    <div class="form_radio">
                        <input id="deletethumbs" name="serendipity[deleteThumbs]" type="radio" value="yes">
                        <label for="deletethumbs">{$CONST.SYNC_OPTION_DELETETHUMBS}</label>
                    </div>
                </div>
            </fieldset>

            <div class="form_buttons">
                <input name="doSync" type="submit" value="{$CONST.CREATE_THUMBS}">
            </div>
        </form>
    </section>
{/if}

</div>
<script src="{serendipity_getFile file='admin/js/jquery.syncheight.js'}"></script>