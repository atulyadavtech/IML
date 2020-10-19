#
mkdir -p /rhel7.6/{1,2,iml5.0,lustre-2.12.1}

Red Hat Enterprise Linux 7.6 Binary DVD
SHA-256 Checksum: 60a0be5aeed1f08f2bb7599a578c89ec134b4016cd62a8604b29f15d543a469c
4.19 GB

RHEL 7.6 Supplementary Binary DVD 
SHA-256 Checksum: 66b6c5551189f6e46f403636d00ae981209803e12ec0a315511a7a5003cb6e93
499 MB

## Repo List
wget https://raw.githubusercontent.com/atulyadavtech/IML/main/chroma_support.repo
wget https://raw.githubusercontent.com/atulyadavtech/IML/main/media.repo

yum install yum-plugin-priorities yum-utils -y

#Verify the priorites 
sed -n -e "/^\[/h; /priority *=/{ G; s/\n/ /; s/ity=/ity = /; p }" /etc/yum.repos.d/*.repo | sort -k3n
yum-config-manager | egrep "^\\[|priority ="

yum install -y python2-iml-manager
