// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){


      // return $(".btn-danger").on("ajax:success", function(e, data, status, xhr) {
       
      //   return alert("The article was deleted.");
      // });
    
  

  // function showMessage() {
  // alert( 'Привет всем присутствующим!' );
  //   };
  //   var a = document.getElementsByClassName('btn-danger');
  //   for(i=0;i<a.length;i++){
  //   	a[i].onclick=function(){
  //   	ajaxData(this);
  //   };}
    // showMessage();


  // return $("#new_type_organization").on("ajax:success", function(e, data, status, xhr) {
  //   return $("#new_type_organization").append(xhr.responseText);
  // }).on("ajax:error", function(e, xhr, status, error) {
  //   return $("#new_type_organization").append("<p>ERROR</p>");
  // });
function ajaxData(btn){
return $(".btn-danger").on("ajax:success", function(e, data, status, xhr) {
     return alert("Запись удалена.");
  }).on("ajax:error", function(e, xhr, status, error) {
     return alert("ERROR");
  });}



});
