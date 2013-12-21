* Create new folder for project `mkdir [projec name]`
* `cd` into that directory
* `curl --remote-name https://raw.github.com/jasonvan/scripts/master/Vagrantfile`
* Set the box you want in the config file e.g., ruby-1.9.3-mysql
* Run `vagrant up` from directory to start up VM
* Run `vagrant ssh`
* `cd /vagrant`
* Install rails with `sudo gem install rails`
* Run `rails new [project name] /vagrant/ -d mysql --skip-test-unit` to create a rails project with mysql and not using test unit
* Run `rm [project name]/.gitignore && rmdir [project name]`
* `curl --remote-name https://raw.github.com/jasonvan/dotfiles/master/.gitignore` 
* Set up database. Edit config/database.yml and set password for development and testing profile to root
* `rake db:create`
* Run `rails s` to make sure project is working
* Add rspec and cabybara to project under :development, :test and :test respectively
* Run `bundle install`
* git init
* Commit initial repo
