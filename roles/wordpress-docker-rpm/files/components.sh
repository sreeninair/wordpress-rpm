 yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel wget rsync

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL
bash --login
rbenv install -v 2.2.1
rbenv global 2.2.1

gem install fpm

mkdir /root/wordpress-rpm

cd /root/wordpress-rpm

wget https://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz

cp -p -r wp-config-sample.php wp-config.php

fpm -s dir -t rpm -n wordpress -v   `` -C  wordpress --prefix=/var/ww/html
