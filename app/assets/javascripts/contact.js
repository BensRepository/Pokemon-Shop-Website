//= require jquery
//= require jquery_ujs
//= require jquery.validate
function ValidateContactForm()
{

  $('#ContactForm').validate({
    rules: {
      name: {required: true},
      email: {required: true, email: true},
      telephone: {required: true},
      message: {required: true},
    },
    messages: {
      name: {required: "Please tell us your name"},
      email: {required: "Please provide an email we can reply too",
      email:"Email must be valid"},
      telephone: {required: "As another means of contact please provide a telephone number"},
      message: {required: "Please enter your query"},
    }

  });

}

$(document).ready(function() {
  if(document.getElementById('ContactForm')){

    ValidateContactForm();

  }
});
