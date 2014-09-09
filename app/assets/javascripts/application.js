// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){

//    $("#dialog").dialog({autoOpen : false, modal : true, show : "blind", hide : "blind"});

    $("li").mouseover(function(){
        $(this).css("cursor", "pointer");
    });

    $("li").click(function(){
      var id = $(this).attr("id");
      window.location = "/"+ id + "/appointments";

    });


   $(".register").click(function(){
       $(".new_appointment").show();
       $(".err").hide();
       $(".appointment").hide();
       $(".comment").hide();
       return false;
   });

   $(".app").click(function(){
        $(".new_appointment").show();
        $(".err").hide();
        $(".appointment").show();
        $(".comment").hide();
        return false;
   });

   $(".cmnt").click(function(){
         $(".new_appointment").show();
         $(".appointment").hide();
         $(".comment").show();
         $(".err").hide();
         return false;
   });

    $("#appointment_time_4i option[value='00']").remove();
    $("#appointment_time_4i option[value='01']").remove();
    $("#appointment_time_4i option[value='02']").remove();
    $("#appointment_time_4i option[value='03']").remove();
    $("#appointment_time_4i option[value='04']").remove();
    $("#appointment_time_4i option[value='05']").remove();
    $("#appointment_time_4i option[value='06']").remove();
    $("#appointment_time_4i option[value='07']").remove();
    $("#appointment_time_4i option[value='08']").remove();
    $("#appointment_time_4i option[value='12']").remove();
    $("#appointment_time_4i option[value='20']").remove();
    $("#appointment_time_4i option[value='21']").remove();
    $("#appointment_time_4i option[value='22']").remove();
    $("#appointment_time_4i option[value='23']").remove();


   $(".cn").tooltip( { position: { my: "bottom+150%", at: "center" }, content: "中国"});
   $(".es").tooltip( { position: { my: "bottom+150%", at: "center" }, content: "Español"});
   $(".us").tooltip( { position: { my: "bottom+150%", at: "center" }, content: "English"});
   $(".fr").tooltip( { position: { my: "bottom+150%", at: "center" }, content: "Français"});
   $(".it").tooltip( { position: { my: "bottom+150%", at: "center" }, content: "Italiano"});
   $(".de").tooltip( { position: { my: "bottom+150%", at: "center" }, content: "Deutsch"});
   $(".tr").tooltip( { position: { my: "bottom+150%", at: "center" }, content: "Türkçe"});

   $(".webmaster-contact-link").click(function (){

       $("#webmaster").dialog({ closeText: ""});
       $("#webmaster").dialog('widget').find(".ui-dialog-titlebar").hide();
       $("#webmaster").dialog('widget').find('.ui-icon .ui-icon-closethick').hide();
       $("#webmaster").dialog('widget').find('.ui-dialog').show();

       return false;
   });
    $(".ex, .cancel, #okay").click(function () {
       $("#webmaster").dialog("close");
    });


    $("#webmaster").submit(function(e) {
        // Serialize the form data.
      var formData = $("#webmaster").serialize();


      // Submit the form using AJAX.
      $.ajax({
        type: 'POST',
        url: $("#webmaster").attr('action'),
        data: formData
      });

       $('#eml').val("");
       $('#msg').val("");

       return false;

    });

    $(".new_appointment").submit(function(){
       var vl1 = $("#appoint_firstname").val();
       var vl2 = $("#appoint_email").val();
       var vl3 = $("#appoint_phone").val();
       var vl4 = $("#appointment_humanizer_answer").val();

       if(vl1=="" || vl2=="" || vl3=="" || vl4==""){
          $(".reqed").fadeOut(300).fadeIn(300).fadeOut(300).fadeIn(300).fadeOut(300).fadeIn(300)
          return false;
       }
    });
});
