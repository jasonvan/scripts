# INSTALL BASE ITEMS
sudo apt-get -y update
sudo apt-get -y install curl build-essential libxslt-dev libxml2-dev zlib1g-dev git-core sqlite3 libxml2 libsqlite3-dev libyaml-dev libssl-dev libreadline-dev vim tmux git-core ack-grep

sudo mkdir -p /data/db
sudo chown -R vagrant:vagrant /data/db
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee -a /etc/apt/sources.list.d/10gen.list
sudo apt-get -y update
sudo apt-get -y install mongodb-10gen

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
