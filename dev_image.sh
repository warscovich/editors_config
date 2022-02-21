#!/bin/bash
# Development image using buildah
# default sane image to do some dev.

echo "setup env variables..."
image = $(buildah from phusion/baseimage:master)
buildah config --env KOTLIN_VERSION="1.6.10" $image
buildah config --env GO_VERSION="1.17.7" $image
buildah config --env HUGO_VERSION="0.92.2" $image
buildah config --env DEBIAN_FRONTEND=noninteractive $image
buildah config --env TERM=linux $image
buildah config --env HOME=root $image
buildah config --env DISPLAY=:0 $image
buildah config --env PATH=/usr/bin/:/usr/local/bin:$GOPATH/bin:/root/kotlinc/bin:$PATH $image

echo "Create container"
buildah run $image echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
# Configure default git user
&& echo "[user]" >> /home/go/.gitconfig \
&& echo "	email = warscovich@gmail.com" >> /home/go/.gitconfig \
&& echo "	name = wars" >> /home/go/.gitconfig \
# Add repositories and update
&& curl -sL https://deb.nodesource.com/setup_16.x | bash - \
&& apt update && apt -y dist-upgrade \
&& apt install -y apt-utils software-properties-common \
&& apt-add-repository universe \
&& apt-add-repository multiverse \
&& apt update \
# Set Locale
&& apt install -y language-pack-en-base \
&& locale-gen en_US en_US.UTF-8 \
&& dpkg-reconfigure locales \
# install development packages and debugging tools
&& apt install -y \
alien \
apache2 \
astyle \
autoconf \
automake \
autotools-dev \
binfmt-support \
binutils-mingw-w64 \
build-essential \
bzip2 \
checkinstall \
clang \
clang-format \
clang-tidy \
cmake \
cppcheck \
curl \
debhelper \
default-jdk \
default-jre \
devscripts \
dh-make \
dnsutils \
dos2unix \
doxygen \
doxygen-latex \
dpkg \
fabric \
fastjar \
flawfinder \
g++ \
gawk \
gcc \
gcc-8 \
gdb \
gettext \
ghostscript \
git \
g++-multilib \
gridengine-drmaa-dev \
gsfonts \
gtk-sharp2 \
htop \
imagemagick \
intltool \
jq \
lcov \
libboost-all-dev \
libbz2-dev \
libc6 \
libc6-dev \
libc6-dev-i386 \
libcurl4-openssl-dev \
libcurlpp-dev \
libffi-dev \
libglib2.0-0 \
libglib2.0-dev \
libgsl-dev \
libicu-dev \
liblapack-dev \
liblzma-dev \
libncurses5-dev \
libssl-dev \
libtool \
libwine-development \
libxml2 \
libxml2-dev \
libxml2-utils \
libxmlsec1 \
libxmlsec1-dev \
libxmlsec1-openssl \
libxslt1.1 \
libxslt1-dev \
llvm \
lsof \
make \
mawk \
memcached \
mingw-w64 \
mingw-w64-i686-dev \
mingw-w64-tools \
mingw-w64-x86-64-dev \
mongodb \
mysql-client \
mysql-server \
nano \
nodejs \
nsis \
nsis-pluginapi \
openjdk-8-jdk \
openjdk-8-jre \
openjdk-11-jdk \
openjdk-11-jre \
openjdk-17-jdk \
openjdk-17-jre \
openssh-client \
openssh-server \
openssl \
pandoc \
parallel \
pass \
pbuilder \
perl \
pkg-config \
postgresql \
postgresql-contrib \
pyflakes \
pylint \
python-all-dev \
python3-all-dev \
python3-pip \
r-base \
redis-server \
redis-tools \
rpm \
rsync \
ruby-all-dev \
screen \
ssh \
strace \
sudo \
swig \
texlive-base \
time \
tree \
ubuntu-restricted-addons \
ubuntu-restricted-extras \
uidmap \
unzip \
upx-ucl \
valgrind \
virtualenv \
wget \
wine64 \
wine64-development-tools \
wine64-tools \
winetricks \
xmldiff \
xmlindent \
xmlsec1 \
zbar-tools \
zip \
zlib1g \
zlib1g-dev \





