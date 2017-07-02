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
    console.log(elements);
    if (elements.length >= 1 && elements[0] != "") {
      console.log("id_result");
      console.log(id_result);
      console.log("seleccion_result");
      console.log(seleccion_result);
      $.ajax({
        type : 'POST',
        url  : 'enviar.php',
        data : {id_result: id_result, seleccion_result: seleccion_result},
        success : function(response){
          console.log(response);
          //window.history.back();
          window.location.replace("proceso.php?proceso_id="+response);
        },
        error: function(response) {
          window.location.replace("proceso.php?proceso_id="+response);
          //alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
      });
    }
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
    console.log(elements);
    if (elements.length >= 1 && elements[0] != "") {
      console.log("cumple condicion");
      $.ajax({
        type : 'POST',
        url  : 'enviar2.php',
        data : {id_result: id_result, seleccion_result: seleccion_result},
        success : function(response){
          console.log(response);
          //window.history.back();
          window.location.replace("proceso.php?proceso_id="+response);
        },
          error: function(response) {
          window.location.replace("proceso.php?proceso_id="+response);
          //alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
      });
    }
  });
});
