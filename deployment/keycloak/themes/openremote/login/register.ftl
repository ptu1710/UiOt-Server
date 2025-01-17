<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('email','password','password-confirm'); section>
    <#if section = "title">
        ${msg("registerTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">
        <form id="kc-register-form" action="${url.registrationAction}" method="post">
            <input type="text" readonly value="this is not a login form" style="display: none;">
            <input type="password" readonly value="this is not a login form" style="display: none;">
            <div class="row">
                <#if !realm.registrationEmailAsUsername>
                    <div class="input-field col s12">
                        <input type="text" id="username" class="validate ${messagesPerField.printIfExists('username','invalid')}" name="username"
                               value="${(register.formData.username!'')}"/>
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                </#if>

                <!-- <div class="input-field col s12">
                    <input type="text" id="firstName" class="validate ${messagesPerField.printIfExists('firstName','invalid')}" name="firstName"
                           value="${(register.formData.firstName!'')}"/>
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div> -->

                <!-- <div class="input-field col s12">
                    <input type="text" id="lastName" class="validate ${messagesPerField.printIfExists('lastName','invalid')}" name="lastName"
                           value="${(register.formData.lastName!'')}"/>
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div> -->

                <div class="input-field col s12">
                    <input type="text" id="email" class="validate ${messagesPerField.printIfExists('email','invalid')}" name="email"
                           value="${(register.formData.email!'')}"/>
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                    <#if messagesPerField.existsError('email')>
                        <span class="helper-text" data-error="${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}"></span>
                    </#if>
                </div>

                <#if passwordRequired>
                    <div class="input-field col s12">
                        <input type="password" id="password" class="validate ${messagesPerField.printIfExists('password','invalid')}" name="password"/>
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>

                    <div class="input-field col s12">
                        <input type="password" id="password-confirm" class="validate ${messagesPerField.printIfExists('password-confirm','invalid')}"
                               name="password-confirm"/>
                        <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                        <#if messagesPerField.existsError('password','password-confirm')>
                            <span class="helper-text" data-error="${kcSanitize(messagesPerField.getFirstError('password','password-confirm'))?no_esc}"></span>
                        </#if>
                    </div>
                </#if>

                <#if recaptchaRequired??>
                    <div class="input-field col s12">
                        <div class="${properties.kcInputWrapperClass!}">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </div>
                </#if>

            </div>

            <div class="col s12 center-align">
                <button class="btn waves-effect waves-light" type="submit" name="register">${msg("doSignUp")}
                    <i class="material-icons right">person_add</i>
                </button>
            </div>

            <div class="col s12 center-align input-field">
                <button class="btn waves-effect waves-light" formaction="${url.loginUrl}">
                    ${msg("backToLogin")}
                </button>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
