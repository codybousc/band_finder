Band Finder
=======================================
###created by: Cody Bouscaren

Band Finder is a web application that allows users to track their favorite bands, and keep track of which venues those bands have played at in the past.


developed with ruby 1.9.3p0


####Setup
_______

Install Band Finder by first cloning the repository.

$git clone https://github.com/codybousc/band_finder.git

Gemfile is included in root folder.

Make sure to bundle gems before using Band Finder:

    $ gem install bundler
    $ bundle


Database will need to be created using postgres/activerecord:

    $ postgres

    Leave this running in its own window

    In a new tab:

    $ rake db:create

    Next:

    $ rake db:migrate

    Start the webserver:

    $ruby app.rb

    In your browser, go to http://localhost:4567



####Debug
________

For bug issues contact codybousc@gmail.com


####License
_________


The MIT License (MIT)

Copyright (c) 2015 Epicodus
