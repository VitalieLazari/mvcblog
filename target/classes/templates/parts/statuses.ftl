<#macro status>
    <table class="table table-bordered table-striped">
        <thead>
        </thead>
        <tbody>
        <#list statuses as s>
            <tr>
                <td>${s.status}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</#macro>