<#import "parts/common.ftl" as c>

<@c.page>
    <div>"Hello, guest"</div>
    <h5>This is my blog</h5>
    <h4>Latest posts</h4>
    <#list posts as post>
        <div class="form-group col-md-8">
            <b><a href="/post/view/${post.id}">${post.title}</a></b>
            <div><i>${post.getUser().getFullName()}
                    <#if post.createTime==post.updateTime>Posted on: ${post.createTime?datetime}<#else>
                        Posted on: ${post.createTime?datetime}, modified on: ${post.updateTime?datetime}</#if></i></div>
            <div><span>${post.content}</span></div>
        </div>
    <#else>
        No posts
    </#list>
</@c.page>
