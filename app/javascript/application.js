// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery 
//= require rails-ujs
//= require moment 
//= require fullcalendar 
//= require activestorage
//= require_tree .

$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function () {
      // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
      if ($('#calendar').length) {
          function eventCalendar() {
              return $('#calendar').fullCalendar({
              });
          };
          function clearCalendar() {
              $('#calendar').html('');
          };

          $(document).on('turbolinks:load', function () {
              eventCalendar();
          });
          $(document).on('turbolinks:before-cache', clearCalendar);

          $('#calendar').fullCalendar({
              events: '/events.json'
          });
      }
  });
});