$(document).ready(function(){
    //document.getElementsByClassName('answer').hide();
    $('.answer').hide();
    $('.show_answer').on('click', function(){
        //$('.answer').hide();
        var data_id = $(this).attr('data_id');
        //alert(data_id);
        //$('.question').css({"border": "", "border-radius": ""});
        $(this).hide();
        $(this).next('.hide_answer').show();
        $(data_id).css('display','block');
        $(this).closest('.question').css({"border": "cornflowerblue solid 5px", "border-radius": "10px", "padding": "10px"});


    });

    $('.hide_answer').on('click', function(){
        var data_id = $(this).attr('data_id');
        $(this).prev('.show_answer').show();
        $(this).hide();
        $(this).closest('.question').css({"border": ""});
        $(data_id).css('display','none');
    });

    $('.theme').hide();
    //$('.themes').removeClass('btn-primary');

    $('.themes').on('click', function(){
        $('.answer').hide();
        $('.question').css({"border": "", "border-radius": "", "padding": ""});

        //alert('click');
        $('.theme').hide();
        $('.themes').removeClass('btn-primary');
        var theme_data_id = $(this).attr('theme_data_id');
        //alert(theme_data_id);
        var element = document.getElementById(theme_data_id)
        $(element).toggle();

        //$(this).removeClass('btn-default');
        $(this).addClass('btn-primary');


    });





});
