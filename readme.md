[ ![Codeship Status for kat3185/breakable-toy](https://codeship.com/projects/6de31910-0bde-0133-93f5-0eda17052741/status?branch=master)](https://codeship.com/projects/90954)

##New School Swing Website:
This app is a website for the swing dancing studio New School Swing.  A visitor can navigate the site to learn about swing dancing, the instructors who teach with the studio, and what classes we are offering.  Both guests and registered users can register and pay for classes, and will recieve email confirmation on completion of registration.

##Under the hood:
###Registration steps:

- User visits the courses_path and decides which month of classes they would like to register for.
- A guest will need to fill in name and e-mail information, a logged in user will not see these fields.  The rest of the form will be the same for both users -- check the classes you wish to take and select your role.
- Enter credit card information and press submit.  This information is sent off to Stripe's server, which returns a stripeToken hidden field in the form.
- Once the stripeToken is created, the registration information and token are sent to the student controller create action, which parses them to create
