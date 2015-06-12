import {Socket} from "phoenix"

// let socket = new Socket("/ws")
// socket.connect()
// let chan = socket.chan("topic:subtopic", {})
// chan.join().receive("ok", chan => {
//   console.log("Success!")
// })

let App = {
}

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
  },
  confirmPassword : {
    identifier : 'confirm_password',
    rules : [{
      type: 'match[password]',
      prompt : 'Password should be the same'
    }]
  }
};


$(".ui.form").form(formRules, formSettings);
$('.message .close').on('click', function() {
  $(this).closest('.message').fadeOut();
});

export default App
