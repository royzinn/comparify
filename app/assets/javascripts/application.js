// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.effect-highlight
//= require bootstrap
//= require turbolinks
//= require jquery.timeago
//= require_tree .

$(function() {
  $("abbr.timeago").timeago();

  // // We use the same API key provided in config/pusher.yml
  // var socket = new Pusher('<%= Pusher.key %>');
  // var channel = socket.subscribe('public_activity');
  // channel.bind('new-activity',
  //     function(data) {
  //       var feed = $('#activity-feed');
  //       if (feed.length > 0){

  //           Retrieve the HTML of activity using the activity_id we
  //           received from Pusher notification.

  //         $.ajax({
  //           url: feed.data("fetchUrl"), // data attribute containing the path we send the request to
  //           data: {id: data.activity_id},
  //           success: function(htmlData) {
  //             feed.prepend(htmlData).children(":first").hide().slideDown();
  //             feed.find("abbr.timeago").timeago();
  //           }
  //         });
  //       }
  //     }
  // );
});
