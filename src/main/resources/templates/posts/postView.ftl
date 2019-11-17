<#import "../parts/common.ftl" as c>
<#include "../parts/security.ftl">

<@c.page>
    <div class="form-group col-md-20">
        <div><b>${post.title}</b></div>
        <div>
            <i><a href="/user/view/${post.user.id}">${post.user.getFullName()}</a> <#if post.createTime==post.updateTime>Posted on: ${post.createTime?datetime}<#else>
                    Posted on: ${post.createTime?datetime}, modified on: ${post.updateTime?datetime}</#if> </i></div>
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
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
                            <a href="/post/delete/${post.id}" class="btn btn-primary btn-sm">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </#if>
    </div>
    <div class="form-group col-md-6">
        <h6>Comments</h6>
    </div>
    <div class="form-group col-md-6">
        <a class="btn btn-primary btn-sm" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false"
           aria-controls="collapse">
            Add new comment
        </a>
    </div>
    <div class="collapse" id="collapse">
        <div class="form-group col-md-6">
            <form action="/comment/create" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="content" class="form-control" placeholder="Enter content"/>
                </div>
                <input type="hidden" value="${name}" name="username">
                <input type="hidden" value="${post.id}" name="postId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-sm">Add</button>
                </div>
            </form>
        </div>
    </div>
    <#if comments?has_content>
        <#list comments as comment>
            <div class="form-group col-md-6">
                <div>
                    <i><a href="/user/view/${comment.user.id}">${comment.user.getFullName()}</a>
                        Posted on: ${comment.createTime?datetime}</i>
                </div>
                <div>
                    <span>${comment.content}</span>
                </div>
                <#if (isAdmin || (name==comment.user.getUsername()?string))>
                    <td><a class="btn btn-primary btn-sm" href="/comment/edit/${comment.id}">Edit</a></td>
                    <button type="button" class="btn btn-primary btn-sm" role="button" data-toggle="modal"
                            data-target="#commentModal${comment.id}">
                        Delete
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="commentModal${comment.id}" tabindex="-1" role="dialog"
                         aria-labelledby="commentModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="commentModalLabel">Deleting coment</h5>
                                    <button type="button btn-primary btn-sm" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Do you really want to delete this comment?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel
                                    </button>
                                    <a href="/comment/delete/${comment.id}" class="btn btn-primary btn-sm">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
        </#list>
    <#else>
        <div class="form-group col-md-6">
            No comments, be the first one who commented this post
        </div>
    </#if>
</@c.page>