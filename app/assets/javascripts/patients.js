$(document).ready(function() {

})

$(document).on('click', '.patient-search-submit', function(){
  console.log("working");
  var doctor_id = $(this).attr('doctor_id');
  var search = $(".patient-search").val()
  $.ajax({
    type: "GET",
    url: '/doctors/' + doctor_id + '/patients/patient_search',
    dataType: 'script',
    data: {q: search}
  })
})

$(document).on('click', '#wait', function(){
  console.log("workflow woo");
  var doctor_id = $(this).attr('doctor_id');
  var patient_id = $(this).attr('patient_id');
  $.ajax({
    type: "PATCH",
    url: '/doctors/' + doctor_id + '/patients/' + patient_id + '/wait_patient',
    dataType: 'script'
  })
})

$(document).on('click', '#checkup', function(){
  var doctor_id = $(this).attr('doctor_id');
  var patient_id = $(this).attr('patient_id');
  $.ajax({
    type: "PATCH",
    url: '/doctors/' + doctor_id + '/patients/' + patient_id + '/checkup_patient',
    dataType: 'script'
  })
})

$(document).on('click', '#xray', function(){
  var doctor_id = $(this).attr('doctor_id');
  var patient_id = $(this).attr('patient_id');
  $.ajax({
    type: "PATCH",
    url: '/doctors/' + doctor_id + '/patients/' + patient_id + '/xray_patient',
    dataType: 'script'
  })
})

$(document).on('click', '#surgery', function(){
  var doctor_id = $(this).attr('doctor_id');
  var patient_id = $(this).attr('doctor_id');
  $.ajax({
    type: "PATCH",
    url: '/doctors/' + doctor_id + '/patients/' + patient_id + '/surgery_patient',
    dataType: 'script'
  })
})

$(document).on('click', '#bill', function(){
  var doctor_id = $(this).attr('doctor_id');
  var patient_id = $(this).attr('patient_id');
  $.ajax({
    type: "PATCH",
    url: '/doctors/' + doctor_id + '/patients/' + patient_id + '/bill_patient',
    dataType: 'script'
  })
})

$(document).on('click', '#discharge', function(){
  var doctor_id = $(this).attr('doctor_id');
  var patient_id = $(this).attr('doctor_id');
  $.ajax({
    type: "PATCH",
    url: '/doctors/' + doctor_id + '/patients/' + patient_id + '/discharge_patient',
    dataType: 'script'
  })
})