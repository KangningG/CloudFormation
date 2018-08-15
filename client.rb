chef_server_url  "https://chef.ascendingdc.com/organizations/fin_org"
validation_client_name "fin_org-validator"
log_location   STDOUT
node_name ENV['CLIENT_NAME']
validation_key          "/etc/chef/validation.pem"
# Using default node name (fqdn)