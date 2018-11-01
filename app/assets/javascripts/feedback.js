function check_input(element,fio) {
    var elem=element;
    for (var i = 0; i < elem.length; i++) {
        var input = elem[i];
        if ($(input).val() == '' || $(input).val() == 0 )
        {
            $(input).addClass('error_border');
        }
    }
}
function check_fio(fio){
    return fio.value == '' || /^[-а-яё._ ]{3,}$/i.test(fio.value);
}
function check_message(mes){
    return mes.value == '' || /^[-0-9а-яё._ a-z!?/\/"':;@#$%^&*\{}\[\]\,\s()]{10,}$/i.test(mes.value) ;
}
function check_tel(tel){
    return tel.value == '' || /^[0-9-()+]{6,16}$/.test(tel.value);
}
function check_email(em){
    return em.value == '' || /^[a-z0-9_+.-]+\@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/i.test(em.value);
}

$(document).ready(function() {
    $('#new_feedback').submit(function (event) {
        event.preventDefault();
        var form = $('#new_feedback').serialize();
        var fr = document.getElementById('new_feedback');
        var elem = fr.getElementsByClassName('form-control');
        var em = document.getElementById('feedback_email');
        var tel = document.getElementById('feedback_tel');
        var fio = document.getElementById('feedback_fio');
        var mes = document.getElementById('feedback_message');
        var them = document.getElementById('feedback_theme_id');
        var org = document.getElementById('feedback_org_text');
        if ($(org).val() == '' || $(them).val() == 0 ||$(em).val() == '' ||$(tel).val() == ''||$(fio).val() == ''||$(mes).val() == '') {

            $('.text').show();
            check_input(elem);
            //$('.form-control').click(function(){
            //    $(this).removeClass('error_border');
            //});
            $('.form-control').change(function () {
                if (!check_fio(fio)) {
                    $('.fio').show();
                }
                else{
                    $('.fio').hide();

                }
                if (!check_message(mes)) {$('.mes').show();}else{$('.mes').hide();}
                if (!check_tel(tel)) {$('.tel').show();}else{$('.tel').hide();}
                if (!check_email(em)) {$('.em').show();}else{$('.em').hide();}

            });

        }
        else {
           $.ajax({
                type: "POST",
                url: "/feedback",
                data: form,
                dataType: "html",
                success: function () {
                    alert('Спасибо за обращение');
                    $("#newModal").modal('hide');
                    console.log('Отправлена форма');
                    location.reload();
                },
                error: function () {
                    alert('Возможно вы не правильно заполнили поля. Проверьте заполнение полей и попробуйте еще раз');
                    console.log('Не отправлена форма');
                }
            });

        }
    });
});


