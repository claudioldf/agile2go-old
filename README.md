Agile2Go
-------

Agile2Go is a opensource Ruby on Rails project for small agile projects.


Setup
-----

    git clone git://github.com/rafaeljesus/agile.git
    cd agile
    bundle
    rake db:migrate
    rake db:seed

Deploy
------

Deploy at Heroku:

    heroku create --stack cedar
    git push heroku master
    heroku run rake db:migrate
    heroku restart

Development
-----------

* Template Engine: ERB
* Testing Framework: RSpec and Factory Girl and Cucumber
* Front-end Framework: Twitter Bootstrap (Sass)
* Form Builder: SimpleForm
* Authentication: Devise
* Authorization: CanCan
* Charts: Hightcharts
* Database: PostgresSQL

Contribute
----------

See the [style guide](https://github.com/copycopter/style-guide).

Maintainers
-----------

* Rafael Jesus (https://github.com/rafaeljesus)

Demo
----

http://agile2go.herokuapp.com/
