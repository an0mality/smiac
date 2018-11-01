// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// vacancies supported directives.
//

//= require jquery
//= require best_in_place
//= require jquery_ujs
//= require jquery-ui
//= require best_in_place.jquery-ui
//= require autocomplete-rails


//= require twitter/bootstrap
//= require redactor-rails
//= require redactor-rails/plugins
//= require redactor-rails/langs/ru
//= require Chart.min
//= require chartkick 
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require bootstrap-datepicker


$(document).ready(function(){
    $(".best_in_place").best_in_place();
    $('#scrollUp').hide();

    $('#scrollUp').on('click', function(){
        window.scrollTo(0,0);
    });

    $(window).scroll(function(){
        if($(window).scrollTop()>100){
            $('#scrollUp').show();
            $('.my_topbar').addClass('positionTop');
            $('#top_logo').hide();
        }
        else { $('#scrollUp').hide();
            $('.my_topbar').removeClass('positionTop');}
            $('#top_logo').show();
    });

    

    

  
    //$('.hasSub').click(function () {
    //    $(this).parent().toggleClass('subactivated');
    //    $(this).parent().children('ul:first').toggle();
    //
    //    if($(this).find('i').hasClass('glyphicon-folder-open')){
    //        $(this).find('i').removeClass('glyphicon-folder-open').addClass('glyphicon-folder-close');
    //    }else{
    //        $(this).find('i').removeClass('glyphicon-folder-close').addClass('glyphicon-folder-open');
    //    }
    //});
    //
    //
    //
    //
    //
    //
    //$(".menufilter").keyup(function () {
    //    //$(this).addClass('hidden');
    //
    //    var searchTerm = $(".menufilter").val();
    //    var listItem = $('.fordtreeview').children('li');
    //
    //    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
    //
    //    //extends :contains to be case insensitive
    //    $.extend($.expr[':'], {
    //        'containsi': function(elem, i, match, array)
    //        {
    //            return (elem.textContent || elem.innerText || '').toLowerCase()
    //                    .indexOf((match[3] || "").toLowerCase()) >= 0;
    //        }
    //    });
    //
    //    $(".fordtreeview li").not(":containsi('" + searchSplit + "')").each(function(e)   {
    //        $(this).hide()
    //    });
    //
    //    $(".fordtreeview li:containsi('" + searchSplit + "')").each(function(e) {
    //        $(this).show();
    //    });
    //});



});

//function hide_show(){
//	var div=document.getElementById("div").style.display;
//	var link=document.getElementById("link").innerHTML;
//	if(div=="")div="block";
//	if(div=="none")
//	{
//		div="block";
//		link="Скрыть карту";
//	}
//	else
//	{
//		div="none";
//		link="Посмотреть по карте";
//	}
//	document.getElementById("div").style.display=div;
//	document.getElementById("link").innerHTML=link;
//};










