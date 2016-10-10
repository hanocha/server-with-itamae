## インストール用コマンドのfor文がうまく動かない

git 'Prezto' do
    repository 'https://github.com/sorin-ionescu/prezto.git'
    destination '/home/hanocha/.zprezto'
    recursive true
    user 'hanocha'
end

execute 'setup Prezto' do
    user 'hanocha'
    cwd '/home/hanocha'
    command %|zsh -c setopt EXTENDED_GLOB
zsh -c for rcfile in /home/hanocha/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "/home/hanocha/.${rcfile:t}"
done|
end
