$(document).ready( function() {

  console.log("Code loaded");
  console.log("Hello Fred");

  $( ".name-test" ).blur(function() {
    if($(".name-test").val() != "") {
      console.log("Remove disabled");
      $(".doctor-submit").removeClass('disabled');
    }    
  });

  $(function() {
     $(".alert").delay(500).fadeIn('normal', function() {
        $(this).delay(2500).fadeOut('slow');
     });
  });
});

// $(document).ready( function() {

//   console.log("BEGIN");

//   $( ".name-test" ).blur(function() {
//     if($(".name-test").val() != "") {
//       console.log("NO BUTTON FOR YOU");
//       $(".doctor-submit").removeClass('disabled');
//     }
//   };
// });