## Currency Exchange
Ruby super simple project providing a basic api for foreign exchange and a basic webapp built using sinatra.
The library's feature can be easily tested using the html form provided.
 
#### How to
In order to run the application you'll need to configure your local environment as follows:
 
- Install ruby ( Recommended version >= 2.0.0, see http://rubyinstaller.org )
 
- Open a prompt and check if ruby has been installed and the version --> ruby -v
 
- Install bundle --> gem install bundle
 
- Install sinatra --> gem install sinatra ( see http://www.sinatrarb.com )
 
- Install test unit --> gem install test-unit ( if ruby >= 2.2.0)
 
- Go to the project root and run --> bundle install (This will install all the libraries the project needs)
 
- Run the shell script get_exchange_rates_daily.sh for getting the most updated file with the exchange data
 
- Run --> ruby runner.rb 
 
The server has been started and you can access the web interface at http://localhost:4567

- Run --> ruby test/tc_currency_converter.rb for running the test
 