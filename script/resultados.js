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
    if (elements.length >= 1 && elements[0] != "") {
      $.ajax({
        type : 'POST',
        url  : 'enviar.php',
        data : {id_result: id_result, seleccion_result: seleccion_result},
        success : function(response){
          console.log(response);
          //window.history.back();
          window.location.replace("proceso.php?proceso_id="+response);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          console.log("error");
          console.log(errorThrown);
          console.log(textStatus);
          alert("Status: " + textStatus); alert("Error: " + errorThrown);
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
    if (elements.length >= 1 && elements[0] != "") {
      $.ajax({
        type : 'POST',
        url  : 'enviar2.php',
        data : {id_result: id_result, seleccion_result: seleccion_result},
        success : function(response){
          console.log(response);
          //window.history.back();
          window.location.replace("proceso.php?proceso_id="+response);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          console.log(errorThrown);
          console.log(textStatus);
          alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
      });
    }
  });
});
