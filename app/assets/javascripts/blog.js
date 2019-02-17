$(window).load(function(){

  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems, options);
  });
});

  $(document).ready(function(){
    $('.modal').modal();
    $('input#input_text, textarea#textarea2').characterCounter();
  });

  $('textarea2').bind('input propertychange', function changedValue() {
    let text = document.getElementById("textarea2");
    let textValue = text.value;
    let row = text.getAttribute('rows');
    let lines = textValue.split(/\r|\r\n|\n/);
    let count = lines.length;
    if (count >= row) {
        text.style.overflowY = "scroll";
    }
    else if (count < row) {
        text.style.overflowY = "hidden";
    }
  });



