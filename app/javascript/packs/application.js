// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "bootstrap"

// My Connections -> Contact Table
$(document).on('turbolinks:load', function () {
  $("li[data-link]").on('click', function (e) {
    if (!$(e.target).is("a"))
      window.location = $(this).data('link')  
  })
})

// Close navbar collapse when clicking outside
$(document).on('turbolinks:load', function () {
  $(document).on('click', function (e) {
      var clickover = $(e.target);
      var _opened = $(".navbar-collapse").hasClass("navbar-collapse collapse show");
      if (_opened === true && !clickover.hasClass("navbar-toggle")) {
          $("button.navbar-toggler").trigger('click');
      }
  });
});
