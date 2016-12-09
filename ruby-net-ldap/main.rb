require 'net/ldap'

#ADサーバーに接続
conn = Net::LDAP.new :host => '10.136.3.175', :port => 389, :base => 'ou=joruri,dc=example,dc=com',
                     :auth => { :username => 'joruri@joruri.example.com', :password => 'pass', :method => :simple }
