
$(document).ready(function() {
  $('#manualToggle').bootstrapSwitch();
  $('#manualToggle').bootstrapSwitch().on('switchChange.bootstrapSwitch', function (event, state){
    var path = window.location.toString();
    path = path.replace("/index", "")
    path = path+"/edit?id="+this.name;
    window.location.href = path;
  });

});
