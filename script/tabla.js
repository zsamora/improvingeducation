/*$("table.table tr th").bind("click", headerClick);
$("table.table tr td").bind("click", dataClick);
$("#saveButton").bind("click",saveButton);
//$("#editar").bind("click",)

function headerClick(e) {
    console.log(e);
    $(e.currentTarget).css({
        color:"red"
    });
}

function dataClick(e) {
    console.log(e);
    if (e.currentTarget.innerHTML != "") return;
    if(e.currentTarget.contentEditable != null){
        $(e.currentTarget).attr("contentEditable",true);
    }
    else{
        $(e.currentTarget).append("<input type='text'>");
    }
}
function saveButton(){
    $("table.table tr td").each(function(td, index){
        console.log(td);
        console.log(index);
    });
}*/
