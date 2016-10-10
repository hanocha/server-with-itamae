user 'hanocha' do
  action :create
  gid 'wheel'
  password '$6$qwerty$w.vCCevZckrG5L5P7koOVQZxROGBMEc5lrUCK63IQnMIVo31D1EZRMv8j5BcU5F3/4FKr3u32KOwWHT2GxBJL1'
end

execute 'set default shell to zsh' do
  command 'chsh -s /bin/zsh hanocha'
  only_if 'chsh -l | grep /bin/zsh'
end

file '/home/hanocha/.zshrc' do
  action :create
  owner 'hanocha'
  mode '0664'
  not_if 'ls /home/hanocha/.zshrc'
end
