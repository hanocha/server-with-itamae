## インストールはできるがitamaeの処理が進まなくなる

execute 'install oh-my-zsh' do
  run_command sudo su -l hanocha sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
end
