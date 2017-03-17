## Currency Exchange
Ruby super simple project providing a basic api for foreign exchange and a basic webapp built using sinatra.
The library's feature can be easily tested using the html form provided.
 
#### How to
In order to run the application you'll need to configure your local environment as follows:
 
- Install ruby ( Recommended version >= 2.0.0, see http://rubyinstaller.org )
 
- Open a prompt and check if ruby has been installed and the version --> ruby -v
 
- Install bundle --> gem install bundle
 
- Install sinatra --> gem install sinatra ( see http://www.sinatrarb.com )
 
- Install rack test --> gem install rack-test (see http://www.sinatrarb.com/testing.html )
 
- Go to the project root and run --> bundle install (This will install all the libraries the project needs)
 
- Run the shell script get_exchange_rates_daily.sh for getting the most updated file with the exchange data
 
- Run --> ruby runner.rb
[2017-03-15 23:07:53] INFO  WEBrick 1.3.1
[2017-03-15 23:07:53] INFO  ruby 2.3.3 (2016-11-21)
== Sinatra (v1.4.8) has taken the stage on 4567 for development with backup from WEBrick
[2017-03-15 23:07:54] INFO  WEBrick::HTTPServer#start: pid=1140 port=4567
 
The server has been started and you can access the web interface at http://localhost:4567
 