<#import "../parts/common.ftl" as c>

<@c.page>
    Post editor
    <form action="/post" method="post">
        <div class="form-group col-md-6">
            <label>Title: </label>
            <input type="text" class="form-control" value="${post.title}" name="title">
        </div>
        <div class="form-group col-md-6">
            <label>Content: </label>
            <input type="text" class="form-control" value="${post.content}" name="content">
        </div>
        <div class="form-group col-md-6">
            <label>Post status: </label>
            <select name="status">
                <#list statuses as status>
                    <option name="status" class="form-control"
                            value="${status.id}"<#if (status.id == post.status.id)> selected="selected"</#if>>${status.status}</option>
                </#list>
            </select>
        </div>
        <input type="hidden" value="${post.id}" name="postId">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group col-md-6">
            <button type="submit" class="btn btn-primary btn-sm">Save</button>
        </div>
    </form>
</@c.page>