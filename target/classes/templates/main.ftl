<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <div>
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search">
                <button type="submit" class="btn btn-primary btn-sm ml-2">Search</button>
            </form>
        </div>
        <div class="form-group col-md-6">
            <a class="btn btn-primary btn-sm" data-toggle="collapse" href="#collapseExample" role="button"
               aria-expanded="false" aria-controls="collapseExample">
                Add new post
            </a>
        </div>
        <div class="collapse" id="collapseExample">
            <div class="form-group col-md-6">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" name="title" class="form-control" placeholder="Enter title"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="content" class="form-control" placeholder="Enter content"/>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
        <#list posts as post>
            <div class="form-group col-md-8">
                <b><a href="/post/view/${post.id}">${post.title}</a></b>
                <div><i><a href="/user/view/${post.user.id}">${post.user.getFullName()}</a>
                        <#if post.createTime?datetime==post.updateTime?datetime>Posted on: ${post.createTime?datetime}<#else>
                            Posted on: ${post.createTime?datetime}, modified on: ${post.updateTime?datetime}</#if></i>
                </div>
                <div><span>${post.content}</span></div>
                <#if (isAdmin || (name==post.getUsername()?string))>
                    <td><a class="btn btn-primary btn-sm" href="/post/edit/${post.id}">Edit</a></td>
                    <button type="button" class="btn btn-primary btn-sm" role="button" data-toggle="modal"
                            data-target="#postModal${post.id}">
                        Delete
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="postModal${post.id}" tabindex="-1" role="dialog"
                         aria-labelledby="postModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="postModalLabel">Deleting post</h5>
                                    <button type="button btn-primary btn-sm" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Do you really want to delete <i>${post.title}</i>?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel
                                    </button>
                                    <a href="/post/delete/${post.id}" class="btn btn-primary btn-sm">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
        <#else>
            No posts
        </#list>

    </div>
</@c.page>