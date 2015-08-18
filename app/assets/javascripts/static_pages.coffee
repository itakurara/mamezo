# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $elm = $('.js-masonry')
  display = ->
    $('.photos').addClass('show')

  $elm.imagesLoaded().done( ->
    $elm.masonry({
      itemSelector: '.js-masonry--item'
      columnWidth: 290
      gutterWidth: 10
      isFitWidth: true
    }) ).done(display)

  
$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:fetch', -> $('.photos').removeClass('show'))
