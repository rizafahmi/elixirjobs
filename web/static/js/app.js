// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "deps/phoenix_html/web/static/js/phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

$('.ui.checkbox').checkbox();

var formSettings = {inline : true, on : 'blur'};

var formRules = {
  name : {
    identifier : 'name',
    rules : [{
      type : 'length[4]',
      prompt : 'Please enter a name, at least 4 characters'
    }]
  },
  password : {
    identifier : 'password',
    rules : [{
      type : 'length[6]',
      prompt : 'Please provide at least 6 character of password'
    }]
  }
};


$(".ui.form").form(formRules, formSettings);
$('.message .close').on('click', function() {
  $(this).closest('.message').fadeOut();
});

export default App
