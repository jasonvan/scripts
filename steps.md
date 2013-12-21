1. Create new folder for project `mkdir [projec name]`
2. `cd` into that directory
3. `curl --remote-name https://raw.github.com/jasonvan/scripts/master/Vagrantfile`
4 Set the box you want in the config file e.g., ruby-1.9.3-mysql
5. Run `vagrant up` from directory to start up VM
6. Run `vagrant ssh`
7. `cd /vagrant`
8. Install rails with `sudo gem install rails`
9. Run `rails new [project name] . -d mysql --skip-test-unit` to create a rails project with mysql and not using test unit
10. Run `rm [project name]/.gitignore && rmdir [project name]`
11. `curl --remote-name https://raw.github.com/jasonvan/dotfiles/master/.gitignore` 
12. Set up database. Edit config/database.yml and set password for development and testing profile to root
13. `rake db:create`
14. Run `rails s` to make sure project is working
15 Add rspec and cabybara to project under :development, :test and :test respectively
16. Run `bundle install`
17. git init
18. Commit initial repo
