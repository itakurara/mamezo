# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $elm = $('.js-masonry')
  $page = $('.page')


  doMasonry = ->
    console.log('よばれたよ')
    $elm.imagesLoaded().done ->
      $elm.masonry({
        itemSelector: '.js-masonry--item'
        columnWidth: 290
        gutterWidth: 10
        isFitWidth: true
      }) 
      return
    return
    
  doMasonry()
  $page.on('click', doMasonry)
  
  return
  


