user 'hanocha' do
  action :create
  gid 'wheel'
  password '$6$qwerty$w.vCCevZckrG5L5P7koOVQZxROGBMEc5lrUCK63IQnMIVo31D1EZRMv8j5BcU5F3/4FKr3u32KOwWHT2GxBJL1'
end

package "vim" do
  action :install
end

package "git" do
  action :install
end

template "/home/vagrant/sudoers.old" do
  source "templates/sudoers"
end

execute "convert lf code dos to unix" do
  command "perl -pe 's/\r//' /home/vagrant/sudoers.old > /home/vagrant/sudoers"
end

execute "copy sudoers file to /etc/sudoers" do
  command "cp /home/vagrant/sudoers /etc/sudoers"
end