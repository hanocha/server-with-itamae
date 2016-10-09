template "/home/vagrant/sudoers.old" do
  source "./templates/sudoers"
end

execute "convert lf code dos to unix" do
  command "perl -pe 's/\r//' /home/vagrant/sudoers.old > /home/vagrant/sudoers"
end

execute "copy sudoers file to /etc/sudoers" do
  command "cp /home/vagrant/sudoers /etc/sudoers"
end
