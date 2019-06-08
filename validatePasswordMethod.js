document.addEventListener('DOMContentLoaded', e => {
  let password = '';

  // for the record, my usual approach to UX is not to
  // use the 'alert' function, this is purely a time-saver
  const raiseAlert = () => {
    alert('Sorry, your password must contain at least one letter, at least one number, and the \'%\' sign, as well as being at least 8 characters long.');
  };

  /**
  ******** HERE'S THE VALIDATION METHOD ********
  */
  const handleSubmit = () => {
    // the console.logs are just to show that the validations produce the expected
    // failures, it's probably not good security practice to tailor the errors

    // is the password at least 8 characters?
    if (password.length < 8) {
      console.log('fails on length');
      raiseAlert();
    // does the password have at least one letter?
    } else if (!/[a-zA-Z]+/.test(password)) {
      console.log('fails on at-least-one-letter');
      raiseAlert();
    // does the password have at least one number?
    } else if (!/[0-9]+/.test(password)) {
      console.log('fails on at-least-one-number');
      raiseAlert();
    // does the password include '%'?
    } else if (!/%/.test(password)) {
      console.log('fails on includes-%');
      raiseAlert();
    // password is good
    } else {
      alert('That\'s a strong password, welcome to the only computer in your state!');
    };
  };

  // password variable is updated as user types
  document.addEventListener('input', e => {
    if (e.target.id === 'password') {
      password = e.target.value;
    };
  });

  document.addEventListener('submit', e => {
    e.preventDefault();
    if (e.target.id === 'form') {
      handleSubmit();
    };
  });
});

/******** TESTS ********

should fail on at-least-one-letter:
987239847

should fail on at-least-one-number:
ahdskjfhakjdh%

should fail on length:
kd7%

should fail on %:
lsjdaf7783

should pass:
7dlajsdoij%
89a8dhf%ioa2%

*/
