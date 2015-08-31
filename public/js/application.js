$(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // Randomize background images
  var images = ['bg01.jpeg', 'bg02.jpeg', 'bg03.jpeg', 'bg04.jpeg', 'bg05.jpeg', 'bg06.jpeg'];
  $('#yielded').css({'background-image': 'url(images/' + images[Math.floor(Math.random() * images.length)] + ')'});

  // Attempt new Language form AJAXing
  var spinnerHTML = '<div class="spinner"><div class="dot1"></div><div class="dot2"></div></div>';
  var $newLanguageContainer = $('#new-language-form-container');

  $('#new-language-button').click(function(e){
    e.preventDefault();
    $(e.target).hide();

    $newLanguageContainer.html(spinnerHTML).addClass('loading').show();

    var promise = $.get('/languages/new');

    promise.always(function(){
      $newLanguageContainer.removeClass('loading').empty();
    });

    promise.done(function(data){
      $newLanguageContainer.html(data);
    });
  });
});


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
