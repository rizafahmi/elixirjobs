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
      type : 'empty',
      prompt : 'Please enter a name'
    }]
  },
  password : {
    identifier : 'password',
    rules : [{
      type : 'empty',
      prompt : 'Please enter your super secret password'
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

export default App
