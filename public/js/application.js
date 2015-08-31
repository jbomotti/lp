$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $(function() {
    var images = ['bg01.jpeg', 'bg02.jpeg', 'bg03.jpeg', 'bg04.jpeg', 'bg05.jpeg', 'bg06.jpeg'];
    $('#yielded').css({'background-image': 'url(images/' + images[Math.floor(Math.random() * images.length)] + ')'});
   });
   

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
