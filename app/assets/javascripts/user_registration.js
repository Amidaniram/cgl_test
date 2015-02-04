$(document).on("page:load ready", function(){
    $('#username').keyup(check_username);
    $('#username').focusout(check_username);
    $('#email').keyup(check_email);
    $('#email').focusout(check_email);
})

function check_username() {
    var username = $('#username').val();
    if (username.length > 2) {
        jQuery.ajax({
            type: "POST",
            url: "check_username",
            datatype: "json",
            data: {"username": username},
            success: function (response) {
                if (response.status == "ok") {
                    $('#username_info').remove();
                    $('#username_label').after("<div class=\"info-field__pass-strength info-field__pass-strength-green\", id=\"username_info\">Свободен <span></span></div>")
                } else if (response.status == "fail") {
                    $('#username_info').remove();
                    $('#username_label').after("<div class=\"info-field__pass-strength info-field__pass-strength-red\", id=\"username_info\">Занят <span></span></div>")
                }
            }
        })
    }
    else
    {
        $('#username_info').remove();
    }
}

function check_email() {
    var email = $('#email').val();
    if (email.length > 5 ) {
        if (isValidEmailAddress(email)) {
            jQuery.ajax({
                type: "POST",
                url: "check_email",
                datatype: "json",
                data: {"email": email},
                success: function (response) {
                    if (response.status == "ok") {
                        $('#email_info').remove();
                        $('#email_label').after("<div class=\"info-field__pass-strength info-field__pass-strength-green\", id=\"email_info\">Свободен <span></span></div>")
                    } else if (response.status == "fail") {
                        $('#email_info').remove();
                        $('#email_label').after("<div class=\"info-field__pass-strength info-field__pass-strength-red\", id=\"email_info\">Занят <span></span></div>")
                    }
                }
            })
        } else {
            $('#email_info').remove();
            $('#email_label').after("<div class=\"info-field__pass-strength info-field__pass-strength-red\", id=\"email_info\">Email is not valid <span></span></div>")
        }
    }
    else
    {
        $('#email_info').remove();
    }

}

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    return pattern.test(emailAddress);
}