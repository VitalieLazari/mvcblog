<#import "../parts/common.ftl" as c>

<@c.page>
    <div class="form-group col-md-6">
        <a href="/register" class="btn btn-primary btn-sm">Add new user</a>
    </div>
    <div class="form-group col-md-6">
        <h2>List of users</h2>
    </div>
    <div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>E-mail</th>
                <th>Status</th>
                <th>Role</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                    <td><a href="/user/view/${user.id}">${user.username}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>
                    <td>${user.getStatus().getStatus()}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a class="btn btn-primary btn-sm" href="/user/edit/${user.id}">Edit</a></td>
                    <td>
                        <button type="button" class="btn btn-primary btn-sm" role="button" data-toggle="modal"
                                data-target="#Modal${user.id}">
                            Delete
                        </button>
                    </td>
                    <!-- Modal -->
                    <div class="modal fade" id="Modal${user.id}" tabindex="-1" role="dialog"
                         aria-labelledby="ModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalLabel">Deleting user</h5>
                                    <button type="button btn-primary btn-sm" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Do you really want to delete <i>${user.getFullName()}</i>?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel
                                    </button>
                                    <a href="/user/delete/${user.id}" class="btn btn-primary btn-sm">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</@c.page>