// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function setImpossibleEvents(impossibleIds) {
  $('.hit').each(function() {
    $(this).parent().removeClass('impossible');
    var id = parseInt($(this).attr('id'));
    if(impossibleIds.includes(id)) {
      $(this).parent().addClass('impossible');
    }
  });
}
