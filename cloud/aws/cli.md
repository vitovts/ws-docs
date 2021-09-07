# --- AWS
# 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# --- aws cli configure
# --- basic
aws configure

aws configure --profile produser
aws s3 ls --profile produser








