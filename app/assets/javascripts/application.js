// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

function loadData(source) {
	alert("hi")
  $('#clear').empty();
  $('#clear_twitter').empty();
  $('#clear_github').empty();
  var src = "#" + source;
  var id = "data_" + source;
  var url = source + "/search?search="
  var xhttp = new XMLHttpRequest();
  var a = document.getElementById(id).value;
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      var responseText = xhttp.responseText;
      $(src).append("<br/>" + $(responseText).find('#data').html());
    }
  };
  xhttp.open("GET", url+a, true);
  xhttp.send();
}