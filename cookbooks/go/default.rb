http_request '/home/hanocha/go1.7.1.linux-amd64.tar.gz' do
  user 'hanocha'
  url 'https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz'
  not_if 'ls /home/hanocha/go1.7.1.linux-amd64.tar.gz'
end
