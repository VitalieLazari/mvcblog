<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div class="mb-1">Add new user</div>
    <#if message??>
        ${message}
    <#else>

    </#if>
    <@l.login "/register" true/>
</@c.page>