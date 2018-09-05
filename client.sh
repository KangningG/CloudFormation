#! /bin/bash

curl -L https://omnitruck.chef.io/install.sh | sudo bash
cd /etc/
sudo mkdir chef
cd /etc/chef
sudo touch client.rb
sudo echo "chef_server_url  \"https://chef.ascendingdc.com/organizations/fin_org\"
validation_client_name \"fin_org-validator\"
log_location   STDOUT
node_name \"client-4\"
validation_key          \"/etc/chef/validation.pem\"
# Using default node name (fqdn)" >>client.rb
sudo touch validation.pem
sudo echo "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAv/fpaYuDC4+oT5twq4KyNLLGulUQxfNZ7twkn2Kfap50CT/H
SR48LdhMaO+8urDaNkQbPYoDEvqlKaHcofy2YhZQcv1SD0MH6YQb0pKQSMiMeUnn
kcyDogOBcuFcr+qU4+FXM9cLDfv2aZBLaPRMphE5qUC9vttgrYk/myVupICXSNZn
b3V/RsumIl+/d0odetBaaeuHMVVlEt8HK5kAwUtqK+qbzq4YaroB8g6q+jQDV9xl
odR0fbDayghTqEm+bJZjXt5CMZ2WRhDtfg/PWVXNFT2G+F0H1R3kJao6xRRvA51j
qiKDKx6s47LpaDBpyMroODgnVPRnSnloNme6ewIDAQABAoIBAHxIBzBSpyOL/P6U
9svDEJZ3i5tEyVgupXGzym35zpWbQipexSl8Tp+rokRpuTjwmEV7sFsWB8l4xgb/
CLVCw90a7ziS8lZ5Ih03bz/TrV/BnthDVY2Z5zqzpFH4vyYQ7BXgZLFmLnz+O9i6
F2g6iYkWK8t845s1shCHg8tw34HVs2LESCtAM+45CTZicbscRgnPo2qGcjY6pJ9r
n9lVkcZ2TwscRxbf4iMpJqthgeImJWw+tgih4PBNl/EtoVCWiZwVvW5IapeXJ9ri
Wg5H5Ym2xnuaG0OtgRV21S0hW5jCZ4cyBsS8qiJyjMp2H+aMTDnkC8P8iwEnqzzX
qtQniAECgYEA5avKWPcxZo6HNCXXJlGJHG4iA1dgnsyFC6yzybBJuQkEsXsir73b
j/vkAFzHmmPXyDOIT54lf9+zLr06RIxVXvQw1z+sTKoGbShTK5TW9YXLCSvlHq8V
cVnsSk8VGxFQC/V9vckbHts8YqB/opikMRTlq/50XoUSoVH05M+RbnsCgYEA1fmn
JpzyttJpRAguNs1l0Th5kykAIujiaKCmtEu2zFH869vrWCBxjf7khimVJ/zddiFR
Hy7zchQ0RlY5ddeWsaTw0Wrvm7abGplc0/EQ6NQHZPI9ybM+R4aOOBBVP2bvZhet
cavvwMCWbyJB3qYC3Jk5qmYurpLdssG1el7XJAECgYBZ88K4vXg3trL1layCcYTG
AcyIinxpNakWPXndEJKPShzwdk3LjwyjhAB0s+Hpchlda/GDXWlKgA7py2s61cvJ
+NH4PBP7oswJjLWmaBEY8GHpIawHLIO1dYa6Q+b8RveW93tcDZv1peAssLfMswP7
xTd++ZYSPwRg8nx78WAAaQKBgEr+94DnHYLKeK6pl1kJ4JfWDXZwtmWF7mTxebxT
lTxDuDwKlpAKvwIfxoTnainbzNssjjw5voXLYw8MBZOx/lVBFE6yBk0zUWWfPxPh
uCWCuxy8cr+RHVEAbjRkNRzFvT6xKc9fjeanGZLWFPQuh24+HiIFMnNpcl7G2g6L
0ygBAoGBAKWYZCbY+KUrk1to+d5dGWtISZ0ZfckkbEt7rulPK2ESzpZS72So5ki/
Tdiuj6HdEspw+h5rBQ3AJieiCfvjsZ0P9G33lXUrNPyVoXo73Tk/ooIz48g5JoqK
1PIr2GEMnhcvlgj2uHTEjniK4Qg63w1JMRNkDSGvr6D9q4RAW8J9
-----END RSA PRIVATE KEY-----" >>validation.pem
#sudo chef-client --once