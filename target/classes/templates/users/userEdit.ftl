<#import "../parts/common.ftl" as c>

<@c.page>
    <div class="form-group row">
        <div class="form-group col-md-6">
            <h2>User editor</h2>
        </div>
    </div>
    <form action="/user" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-6">
                <input type="text" value="${user. username}" name="username" class="form-control"
                       placeholder="User name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">First name: </label>
            <div class="col-sm-6">
                <input type="text" value="${user. firstName}" name="firstName" class="form-control"
                       placeholder="First name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Last name: </label>
            <div class="col-sm-6">
                <input type="text" value="${user. lastName}" name="lastName" class="form-control"
                       placeholder="Last name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-6">
                <input type="text" value="${user. password}" name="password" class="form-control"
                       placeholder="Password"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">E-mail: </label>
            <div class="col-sm-6">
                <input type="text" value="${user. email}" name="email" class="form-control" placeholder="E-mail"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User status: </label>
            <div class="col-sm-6">
                <select name="status">
                    <#list statuses as status>
                        <option name="status"
                                value="${status.id}"<#if (status.id == user.status.id)> selected="selected"</#if>>${status.status}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User roles: </label>
            <div class="col-sm-6">
                <#list roles as role>
                    <div class="form-group">
                        <label><input type="checkbox"
                                      name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                        </label>
                    </div>
                </#list>
            </div>
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group">
            <button class="btn btn-primary btn-sm" type="submit">Save</button>
        </div>
    </form>
</@c.page>