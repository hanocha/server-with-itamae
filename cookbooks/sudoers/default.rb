template "/tmp/sudoers" do
  source "./templates/sudoers"
end

execute "convert lf code dos to unix" do
  command "perl -pe 's/\r//' /tmp/sudoers > /etc/sudoers"
end
