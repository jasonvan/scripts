# Create a new rails project on Vagrant

* Create new folder for project `mkdir [projec name]`
* `cd` into that directory
* `curl --remote-name https://raw.githubusercontent.com/jasonvan/scripts/master/Vagrantfile`
* Set the box you want in the config file e.g., ruby-1.9.3-mysql
* Uncomment the rails port-forwarding and mysql port-forwarding
* Run `vagrant up` from directory to start up VM
* Run `vagrant ssh`
* `cd /vagrant`
* Install rails with `sudo gem install rails`
* Run `rails new [project name] . -d mysql --skip-test-unit` to create a rails project with mysql and not using test unit
* Run `rm [project name]/.gitignore && mv [project name]/* ./ && rmdir [project name]`
* `curl --remote-name https://raw.githubusercontent.com/jasonvan/dotfiles/master/.gitignore` 
* Set up database. Edit config/database.yml and set password for development and testing profile to root
* `bundle exec rake db:create:all`
* `sudo nano /etc/mysql/my.cnf` and update `bind-address = 0.0.0.0`
* `sudo service mysql restart`
* Set up sequel pro to connect to mysql db. SSH password is vagrant ![](https://raw2.github.com/jasonvan/scripts/master/sequel-pro-configs.png)
* Add rspec and cabybara to project under :development, :test and :test respectively

```ruby
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'database_cleaner'
  gem 'capybara'
end
```

* Run `bundle install`
* `bundle exec rails generate rspec:install`
* Confirm that .rspec and rspec directory was created
* Add `--format documentation` to `.rspec`
* Update config/application.rb to include the following inside of Application class:

```ruby
config.generators do |g|
  g.test_framework :rspec,
    fixtures: true,
    view_specs: false,
    helper_specs: false,
    routing_specs: false,
    controller_specs: true,
    request_specs: false
  g.fixture_replacement :factory_girl, dir: "spec/factories"
end
```
* `bundle exec rake db:test:clone`
* `bundle exec rspec`
* Run `rails s` to make sure project is working
* git init
* Commit initial repo

