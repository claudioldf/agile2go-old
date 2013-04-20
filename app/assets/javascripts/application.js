// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require twitter/bootstrap/bootstrap-transition
//= require twitter/bootstrap/bootstrap-tooltip
//= require twitter/bootstrap/bootstrap-alert
//= require twitter/bootstrap/bootstrap-modal
//= require twitter/bootstrap/bootstrap-button
//= require twitter/bootstrap/bootstrap-collapse
//= require_tree .

$(document).ready(function(){	
  loadTooltip();
	dataTable();	
});

function loadTooltip(){
  editTooltip();
  delTooltip(); 
  changeRoleTootip();  
  homeTooltip();
}

function changeRoleTootip(){
  $("a#change-role").each(function(){
    $(this).tooltip();       
  });       
  return false;
}

function homeTooltip(){
  $("a#home-tootip").each(function(){
    $(this).tooltip();       
  });       
  return false;
}

function editTooltip(){
  $("a#edit-tooltip").each(function(){
    $(this).tooltip();       
  });     	
  return false;
}

function delTooltip(){
  $("a#del-tooltip").each(function(){
    $(this).tooltip();       
  });       
  return false;
}

function dataTable(){
	$('.datatable').dataTable({
    	"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    	"sPaginationType": "bootstrap",    	 
  		"sScrollX": "100%",
  		"bScrollCollapse": true
      //"aoColumns": [null, null]  		
 	});
}

$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true})
});


