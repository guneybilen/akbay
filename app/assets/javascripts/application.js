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

    $('.imgs').hide().show('blind', 1000);

    var map;
    google.maps.event.addDomListener(window, 'load', initialize);

    function initialize() {
             var myLatlng = new google.maps.LatLng(41.077694, 29.025575);

             var mapOptions = {
                 zoom: 16,
                 center: myLatlng,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             };

             var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

             var marker = new google.maps.Marker({
                 position: myLatlng,
                 map: map,
                 title: 'Op. Dr. Seyfi Akbay\nNisbetiye cad. Seyran apt.\nNo:35 K:2/A 34337\nEtiler - Istanbul / TURKEY\n90(212) 352-6464\n90(532) 542-5599\nFAX +90(212) 351-5253'
             });

             var contentString = 'Op. Dr. Seyfi Akbay<br>Nisbetiye cad. Seyran apt.<br>No:35 K:2/A 34337<br>Etiler - Istanbul / TURKEY<br>90(212) 352-6464<br>90(532) 542-5599<br>FAX +90(212) 351-5253';

             google.maps.event.trigger(map, 'resize');

//           partial map display, in jQuery dialog window, problem's solution is below addListenerOnce method
             google.maps.event.addListenerOnce(map, 'idle', function() {
                google.maps.event.trigger(map, 'resize');
                 map.setCenter(myLatlng);
             });
//           partial map display, in jQuery dialog window, problem's solution is above addListenerOnce method

             var infowindow = new google.maps.InfoWindow({
                 content: contentString
             });

             google.maps.event.addListener(marker, 'click', function () {
                 infowindow.open(map, marker);
             });


         }


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

    $('.mp').on('click', function (){

        initialize();
        $("#map_canvas").dialog({ closeText: ""});
//        $("#map_canvas").dialog( "option", "height", 400 );
//        $("#map_canvas").dialog('widget').find(".ui-dialog-titlebar").css({ height: 10 });
//        $("#map_canvas").dialog('widget').find('.ui-icon .ui-icon-closethick').hide();
//        $("#map_canvas").dialog('widget').find('.ui-dialog').show();
//        $("#map_canvas").dialog('widget').find(".ui-dialog-titlebar").css("height", "1%");

        $("#map_canvas").dialog({
            autoOpen:false,
            width: 400,
            height: 350,
            resizable: true,
            hide: {effect: "fadeOut", duration: 500},
            title: "Op. Dr. Seyfi Akbay",

            resizeStop: function (event, ui) {
                google.maps.event.trigger(map, 'resize')
            },
            open: function (event, ui) {
                google.maps.event.trigger(map, 'resize');
            },

            close: function() {
                $(this).dialog('destroy');
             }
        });

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

    if($('li').hasClass('flg_in_app_new'))
        {
          $('li').off();
          $('li').tooltip("close");
    //        $('li').tooltip({hide: false});

        }
});
