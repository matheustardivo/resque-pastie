# Resque-pastie: a pastebin app using Rails and Resque

## Installation

    brew install redis
    redis-server /usr/local/etc/redis.conf
    git clone git@github.com:matheustardivo/resque-pastie.git
    cd resque-pastie
    bundle install
    rake resque:work QUEUE='*'
    rails server
    Point your browser to http://localhost:3000

