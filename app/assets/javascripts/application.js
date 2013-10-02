// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require twitter/bootstrap
//= require modal
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require twitter/bootstrap/bootstrap-transition
//= require twitter/bootstrap/bootstrap-tooltip
//= require twitter/bootstrap/bootstrap-alert
//= require twitter/bootstrap/bootstrap-modal
//= require twitter/bootstrap/bootstrap-button
//= require twitter/bootstrap/bootstrap-collapse

$(function() {
  App.init();
});

App = {

  init : function() {
    this.dataTables();
    this.tooltips();
    this.calendar();
    $('#flash_notice').parent().delay(800).fadeIn(400);
  },

  dataTables : function(){
    $('.datatable').dataTable({
      "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
      "sPaginationType": "bootstrap",
      "sScrollX": "100%",
      "bScrollCollapse": true
    });
  },

  tooltips : function() {
    $('a[rel=popover]').popover();
    $('.tooltip').tooltip();
    $('a[rel=tooltip]').tooltip();

    $.each($('.ttip-bottom'), function(){
      $(this).tooltip({placement: 'bottom'})
    });
    $.each($('.ttip-right'), function(){
      $(this).tooltip({placement: 'right'})
    });
    $.each($('a'), function(){
      $(this).tooltip();
    });
  },

  calendar : function() {
    $("[data-behaviour˜='datepicker']").on('mouseover', function(){
      $(this).datepicker({ format : 'yyyy-mm-yy', weekStart : 1, autoclose : true});
    });
  }

}



