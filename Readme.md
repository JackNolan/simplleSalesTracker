#Steam Watch

This is a tool created to track steam game prices. Select a game, then enter a price and email to be alerted if the game's price ever fails below the specified price.

This tool was created by [Jack Nolan](https://github.com/jacknolan/) at the [Flatiron School](http://flatironschool.com/).

#Installation

    git clone git://github.com/JackNolan/simplleSalesTracker.git
    cd simplleSalesTracker
    bundle install
    rake db:migrate
    rake check_prices