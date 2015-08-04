# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $elm = $('.js-masonry')
  $elm.imagesLoaded().done ->
    $elm.masonry({
      itemSelector: '.js-masonry--item'
      columnWidth: 290
      gutterWidth: 10
      isFitWidth: true
    }) 
  $page = $('.page')
  $page.on('click', doMasonry)
  
$(document).ready(ready)
$(document).on('page:load', ready)
