// main.js

$(function(){
    $('form').submit(function(){
        var url = $('#url').val();
        $.ajax({
            url:url
        }).done(function(data){
            console.log(date);
        });
        return false;
    });
});
