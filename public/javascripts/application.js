$(document).ready(function() {
  var urlInput = $('.input.url'),
      tokenInput = $('.input.token');

  $('.markdown').hide();

  urlInput.keyup(function(e){
    if(e.keyCode == 13)
    {
      $.get("/badge/" + urlInput.val()).always(
        function(badgeUrl) {
          $('.url-result').attr('href',badgeUrl).attr('target', '_blank').html('Test');
          $('.markdown').show().find('input').val(
            '[![Build Status](' + badgeUrl + ')](' + urlInput.val() + ')'
          );
        }
      ).fail(
        function(){
          $('.url-result').attr('href', '#').attr('target', null).html("Invalid URL");
          $('.markdown').hide();
        }
      );
    }
  });

  tokenInput.keyup(function(e){
    if(e.keyCode == 13) {
      window.location = window.location.pathname + "?token=" + tokenInput.val();
    }
  });
});
