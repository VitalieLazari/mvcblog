<#include "security.ftl">

<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="User name"/>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> First Name : </label>
                <div class="col-sm-6">
                    <input type="text" name="firstName" class="form-control" placeholder="First name"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Last Name : </label>
                <div class="col-sm-6">
                    <input type="text" name="lastName" class="form-control" placeholder="Last name"/>
                </div>
            </div>
        </#if>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password"/>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> E-mail : </label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="E-mail"/>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group">
            <#if !isRegisterForm>
                <a href="/register" class="btn btn-primary btn-sm">Add new user</a>
            </#if>
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-sm" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if name!="unknown">
            <button class="btn btn-primary btn-sm" type="submit">Sign Out</button>
        </#if>
    </form>
</#macro>