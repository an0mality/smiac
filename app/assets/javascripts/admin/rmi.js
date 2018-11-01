
$(document).ready(function(){

    $('.answer_admin').hide();

    $('.rmi_theme_admin').on('click', function(){
        $('.answer_admin').hide();
        $('.rmi_theme_admin').removeClass('btn-primary');
        var data_id = $(this).attr('data_id')
        //alert(data_id);
        var element = document.getElementById(data_id)
        element.style.display='block';
        //$(data_id).show();
        //elem = document.getElementById(data_id);
        $(this).addClass('btn-primary');
    });



});
