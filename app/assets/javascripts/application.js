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

App = {};

(function() {

  App.el = function() {
    var tooltips = function() {
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
    };

    var calendar = function() {
      $("[data-behaviour~='datepicker']").on('mouseover', function(){
        $(this).datepicker({ format : 'yyyy-mm-yy', weekStart : 1, autoclose : true});
      });
    };

    return {
      init : function(){
        tooltips();
        calendar();
      }
    }
  }
})();

App.el().init()

