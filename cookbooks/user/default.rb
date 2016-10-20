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

directory '/home/hanocha/.ssh' do
  action :create
  owner 'hanocha'
  mode '0755'
end

file '/home/hanocha/.ssh/authorized_keys' do
  action :create
  content 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPfGefLMVA0Yzal1R482NSz0RHE2gp5ahpccAks8GUe2JCjJZNQc41CTCTqw1DcNOUbMY4jIFpsuj8fR1HXcH8aIx8VfDs5dfOMHGQP+A6lwWEfM008OYhK8wCHDE/uT9gcSzK4+sIyMfKnn6y8Bjnh6j1SkwExSPmp1k7SmtcD9V+4EtiuisjN1ycDt2K80P65dCU3gTggFX7nXLVedRW+BMxgxm8GAdLmnSpJvrfMVTrK4FDWPvIRAuIdj/WMWa/okXdMtmpCdJpMq2fezwRd7mOnhg3YdAcApVUuZuooVgTrkKJI22cct8oBPEM4OXfKkhbOuKOPqhkmZflAdDf'
  owner 'hanocha'
  mode '0600'
end
