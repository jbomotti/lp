$(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // Randomize background images ////////////////////////////
  var images = ['bg01.jpeg', 'bg02.jpeg', 'bg03.jpeg', 'bg04.jpeg', 'bg05.jpeg', 'bg06.jpeg'];
  $('#yielded').css({'background-image': 'url(/images/' + images[Math.floor(Math.random() * images.length)] + ')'});
  // End Random Backgroun ///////////////////////////////////

  // Attempt new Language form AJAXing //////////////////////
  var spinnerHTML = '<div class="spinner"><div class="dot1"></div><div class="dot2"></div></div>';
  var $newLanguageContainer = $('#new-language-form-container');

  // Clicking the Add Language Button
  $('#new-language-button').click(function(e){
    e.preventDefault();
    $(e.target).hide();

    // Attempt fancy loading magic - much work needed here
    $newLanguageContainer.html(spinnerHTML).addClass('loading').show();

    var promise = $.get('/languages/new');

    promise.always(function(){
      $newLanguageContainer.removeClass('loading').empty();
    });

    // Give the div the form from the post set in promise
    promise.done(function(data){
      $newLanguageContainer.html(data);
    });
  });

  // Apply that AJAX magic to the actual submission of the fancy form
  $('#new-language-form-container').on('submit','form', function(e){
    e.preventDefault();

    // Capture all that good form data
    var $form = $(e.target);
    var promise = $.post('/languages', $form.serialize());

    promise.done(function(dataHtml){
      // Make form go away
      $newLanguageContainer.empty();
      var $languages = $('#languages');
      var $languageHtml = $(dataHtml);
      // Add new item to the languages page under the div with id languages
      // Per post route above, item formatted according to _item.erb
      $languages.append($languageHtml);

      // Bring that button back!
      $('#new-language-button').show();
    });

    // If all doesn't go as planedd...
    promise.fail(function(jxhr, data){
      $newLanguageContainer.html(jxhr.responseText);
    });
  });
  // End New Language AJAXing ///////////////////////////////
  $('.add_remove_lang').on('click', '#add_language_button', function(event) {
    event.preventDefault();
    that = this;
    var route = $(this).attr("href");
    var promise = $.get(route);
    promise.done(function(data){
      $(that).parent().html(data);
    });
  });
  $('.add_remove_lang').on('click', '#remove_language_button', function(event) {
    event.preventDefault();
    that = this;
    var route = $(this).attr("href");
    var promise = $.get(route);
    promise.done(function(data){
      $(that).parent().html(data);
    });
  })

});


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
