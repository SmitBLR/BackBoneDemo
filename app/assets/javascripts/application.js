// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require backbone_rails_sync
//= require backbone_datalink
//= require backbone/back_bone_demo
//= require_tree .

function notify(model, error)
{
    var valid = true;
    for (var er in error)
    {
        valid = false;
        $("#" + er).css("border-color", "red");
        errors.innerHTML += "<div class='error'>" + error[er] + "</div>";
    }
    return valid;
}

$(function() {
  $("#employees th a, #pagination .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});