### By:
Isaac Overstreet
Epicocdus Oct 2021 full time cohort

# Description:
 
This application is meant to be used by kids to input words onto a list. They also have the option to add definitions to the words and sort them alphabetically with the click of a button. The app automatically capitalizes the words so the sorting wont get confused.

# Technologies Used

* Bootstrap
* Ruby
* Docker
* Sinatra
* rspec
* pry

# Setup/Installation Requirements

* Navigate to https://github.com/mrunderoad/the-word-definer and clone the repo onto your local machine.
* Open the project in VS code.
##### (DOCKER) 
* Run `docker-compose up` to get port number. example=`port=4567`
* Start a live server and in the URL bar type in the port number it gives you from the previous step.
* Next, click on localhost:4567(or whatever number it gives you) in your session details to view project!
* Run `docker-compose run --rm web bundle exec rspec` to view test specs for unit testing and integration testing.
##### (Mac)
* Run `ruby app.rb` in your terminal to open a localhost page to view application.
* Run `rspec` to run tests
* ENJOY! 

## Known Bugs
No known bugs at this time.

## License
MIT licensing @https://opensource.org/licenses/MIT

Copyright (c) 12/17/2021 Isaac Overstreet