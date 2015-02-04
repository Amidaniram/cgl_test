$(document).ready(function(){
    $('#username').keyup(check_username);
})
function check_username() {
    var username = $('#username').val()
    jQuery.ajax({
        type: "POST",
        url: "check_username",
        datatype: "json",
        data: { "username": username},
        success: function(response){
            console.log(response);
        }
    })
}
;