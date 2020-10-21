chmod +x /etc/rc.d/rc.local


#Selinux Disabled
sed -i 's/=enforcing/=disabled/' /etc/selinux/config
echo 0 >/selinux/enforce


#TimeZone Setup
timedatectl set-timezone Asia/Kolkata
timedatectl set-ntp yes


#Hostname Verfiycation 
hostnamectl status
hostname -A;hostname -d;hostname -f;hostname -i;hostname -I

#
mkdir -p /rhel7.6/{1,2}


## Repo List
wget https://raw.githubusercontent.com/atulyadavtech/IML/main/chroma_support.repo -O /etc/yum.repos.d/chroma_support.repo
wget https://raw.githubusercontent.com/atulyadavtech/IML/main/media.repo -O /etc/yum.repos.d/media.repo
wget https://raw.githubusercontent.com/atulyadavtech/Conf-Files/master/history-sh -O /etc/profile.d/history.sh


wget https://github.com/atulyadavtech/IML/releases/download/latest/iml5.0.tar -O /rhel7.6/iml5.0.tar
wget https://github.com/atulyadavtech/IML/releases/download/latest/lustre-2.12.1.tar -O /rhel7.6/lustre-2.12.1.tar

tar -xvf /rhel7.6/iml5.0.tar -C /rhel7.6/
tar -xvf /rhel7.6/lustre-2.12.1.tar -C /rhel7.6/

yum install yum-plugin-priorities yum-utils -y

#Verify the priorites 
sed -n -e "/^\[/h; /priority *=/{ G; s/\n/ /; s/ity=/ity = /; p }" /etc/yum.repos.d/*.repo | sort -k3n
yum-config-manager | egrep "^\\[|priority ="

yum install -y python2-iml-manager

