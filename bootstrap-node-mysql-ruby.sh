#!/usr/bin/env bash

# INSTALL BASE ITEMS
sudo apt-get -y update
sudo apt-get -y install curl build-essential libxslt-dev libxml2-dev zlib1g-dev git-core sqlite3 libxml2 libsqlite3-dev libyaml-dev libssl-dev libreadline-dev vim tmux git-core ack-grep

# INSTALL NODE
sudo apt-get -y install python-software-properties
sudo apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get -y install nodejs

# INSTALL MYSQL
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev

# INSTALL RUBY
sudo rm -rf /opt/vagrant_ruby
curl --remote-name http://ftp.ruby-lang.org/pub/ruby/1.9/$4.tar.gz
tar zxf $4.tar.gz
cd $4
./configure
make
sudo make install
cd /home/vagrant
sudo rm -rf $4
sudo rm -rf $4.tar.gz
sudo gem install bundler

# INSTALL VIM/TMUX ESSENTIALS
su -c "git clone https://github.com/jasonvan/dotfiles" vagrant
su -c "mkdir -p .vim .vim/autoload .vim/bundle .vim/backup" vagrant
su -c "curl -Sso .vim/autoload/pathogen.vim  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim" vagrant
su -c "mv dotfiles/.vimrc ./.vimrc" vagrant
su -c "mv dotfiles/.vimrc_main ./.vimrc_main" vagrant
su -c "mv dotfiles/.tmux.conf ./.tmux.conf" vagrant
su -c "rm -rf dotfiles" vagrant

# INSTALL VIM PLUGINS
cd .vim/bundle
su -c "git clone https://github.com/scrooloose/nerdtree" vagrant
su -c "git clone https://github.com/altercation/vim-colors-solarized.git" vagrant
su -c "git clone https://github.com/mileszs/ack.vim.git" vagrant
su -c "git clone https://github.com/kien/ctrlp.vim.git" vagrant
su -c "git clone https://github.com/walm/jshint.vim" vagrant
su -c "git clone https://github.com/scrooloose/nerdcommenter.git" vagrant
su -c "git clone https://github.com/msanders/snipmate.vim.git" vagrant
su -c "git clone https://github.com/ervandew/supertab.git" vagrant
su -c "git clone http://github.com/tsaleh/vim-align.git" vagrant
su -c "git clone https://github.com/terryma/vim-multiple-cursors" vagrant
su -c "git clone https://github.com/Lokaltog/vim-powerline.git" vagrant

#POST INSTALL
#sudo bundle install
#rake db:create
#mysql -uroot -p [DATABASE NAME] < [SQL FILE]
