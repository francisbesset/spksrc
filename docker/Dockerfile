FROM debian:stable

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y build-essential debootstrap python-pip automake libgmp3-dev libltdl-dev libunistring-dev libffi-dev ncurses-dev imagemagick libssl-dev pkg-config zlib1g-dev gettext git curl subversion check intltool gperf flex bison xmlto php5 expect libgc-dev mercurial cython lzip cmake swig
RUN pip install -U pip==1.5.4 && \
    /usr/local/bin/pip install -U setuptools wheel==0.23 httpie


ADD start.sh /
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
