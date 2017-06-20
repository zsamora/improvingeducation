$('document').ready(function() {
  $('#send_button1').click(function() {
    var val = $('input:checked').serialize();
    var elements = val.split("&");
    var id_result = []
    var seleccion_result = []
    for (var i = 0; i < elements.length; i++){
      var x = elements[i].split("=");
      id_result.push(parseInt(x[0]));
      seleccion_result.push(parseInt(x[1]));
    }
    $.ajax({
			type : 'POST',
			url  : 'enviar.php',
			data : {id_result: id_result, seleccion_result: seleccion_result},
      success : function(response){
        setTimeout(' window.location.href = "welcome.php"; ',1000);
        //alert("Encuesta enviada");
      }
    });
  });
  $('#send_button2').click(function() {
    var val = $('input:checked').serialize();
    var elements = val.split("&");
    var id_result = []
    var seleccion_result = []
    for (var i = 0; i < elements.length; i++){
      var x = elements[i].split("=");
      id_result.push(parseInt(x[0]));
      seleccion_result.push(parseInt(x[1]));
    }
    $.ajax({
      type : 'POST',
      url  : 'enviar2.php',
      data : {id_result: id_result, seleccion_result: seleccion_result},
      success : function(response){
        setTimeout(' window.location.href = "welcome.php"; ',1000);
        //alert("Encuesta enviada");
      }
    });
  });
});