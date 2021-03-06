package 'gcc'
package 'openssl-devel'
package 'readline-devel'

git 'rbenv' do
  repository 'https://github.com/rbenv/rbenv.git'
  destination '/usr/local/rbenv'
end

git 'ruby-build' do
  repository 'https://github.com/rbenv/ruby-build.git'
  destination '/usr/local/rbenv/plugins/ruby-build'
end

execute 'init rbenv' do
  command '/usr/local/rbenv/bin/rbenv init -'
  not_if 'rbenv -v'
end

directory '/usr/local/rbenv/shims' do
  action :create
end

directory '/usr/local/rbenv/versions' do
  action :create
end

template '/tmp/rbenv.sh' do
  source './templates/rbenv.sh'
  user 'root'
  group 'root'
  mode '0644'
end

execute "convert lf code dos to unix on /etc/profile.d/rbenv.sh" do
  command "perl -pe 's/\r//' /tmp/rbenv.sh > /etc/profile.d/rbenv.sh"
end

execute "install ruby 2.3.1" do
  command "rbenv install 2.3.1"
  not_if 'rbenv versions | grep 2.3.1'
end

execute 'set global ruby version to 2.3.1' do
  command 'rbenv global 2.3.1'
  only_if 'rbenv versions | grep 2.3.1'
end

execute 'install bundler with ruby 2.3.1' do
  command 'gem install bundler'
  only_if 'rbenv versions | grep 2.3.1'
end
