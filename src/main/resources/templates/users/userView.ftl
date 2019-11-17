<#import "../parts/common.ftl" as c>
<#include "../parts/security.ftl">

<@c.page>
    <div class="form-group row">
        <div class="form-group col-md-6">
            <h2>User details</h2>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> User Name : </label>
        <div class="col-sm-6">
            ${userDetails.username}
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">First name: </label>
        <div class="col-sm-6">
            ${userDetails.firstName}
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Last name: </label>
        <div class="col-sm-6">
            ${userDetails.lastName}
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password: </label>
        <div class="col-sm-6">
            ${userDetails.password}
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">E-mail: </label>
        <div class="col-sm-6">
            ${userDetails.email}
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">User status: </label>
        <div class="col-sm-6">
            ${userDetails.status.status}
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">User roles: </label>
        <div class="col-sm-6">
            <div class="form-group">
                <label><#list userDetails.roles as role>${role}<#sep>,</#list></label>
            </div>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <div class="form-group">
        <a class="btn btn-primary btn-sm" href="/user/edit/${userDetails.id}">Edit</a>
        <button type="button" class="btn btn-primary btn-sm" role="button" data-toggle="modal" data-target="#Modal">
            Delete
        </button>
        <!-- Modal -->
        <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Deleting user</h5>
                        <button type="button btn-primary btn-sm" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Do you really want to delete <i>${userDetails.getFullName()}</i>?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
                        <a href="/user/delete/${userDetails.id}" class="btn btn-primary btn-sm">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>