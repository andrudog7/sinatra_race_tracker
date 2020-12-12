# Specifications for the Sinatra Assessment

Specs:
- [x] I required the Sinatra gem and my Application Controller inherits from Sinatra::Base.  [Use Sinatra to build the app]
- [x] I required the ActiveRecord gem and all of my models inherit from ActiveRecord::Base as well as my migrations for tables from ActiveRecord::Migration. [Use ActiveRecord for storing information in a database]
- [x] I have two model classes:  User and Race.  [Include more than one model class (e.g. User, Post, Category)]
- [x] My User class has_many races. [Include at least one has_many relationship on your User model (e.g. User has_many Posts)]
- [x] My Race class belongs_to a user.  [Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)]
- [x] I validate both username and email for uniqueness at the top of their respective classes. [Include user accounts with unique login attribute (username or email)]
- [x] My Race Controller has routes for CRUD.  [Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying]
- [x] Users are only allowed to see content they have created after they login.  They cannot view or edit content created by other users.  [Ensure that users can't modify content created by other users]
- [x] I have parameters set up so the user has to enter finish_time and pace in specific formats.  They are also provided a drop down of distances to choose from to ensure they choose a correct option.  [Include user input validations]
- [x] If a user tries to Sign Up with a username or email that is already taken, a message will show up in red telling them to choose a different one. [BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)]
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
