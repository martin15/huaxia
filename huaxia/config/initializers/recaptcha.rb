# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.public_key  = '6LcLeR0TAAAAADR_PWN2sL2HfZ36qPRyaHsk2n8-'
  config.private_key = '6LcLeR0TAAAAAHYxtc6Or1aYiTOkmOUz8nRQugZp'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end