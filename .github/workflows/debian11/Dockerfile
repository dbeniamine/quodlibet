FROM debian:buster

RUN apt-get update && apt-get install -y \
        appstream-util \
        dbus-x11 \
        gettext \
        gir1.2-gst-plugins-base-1.0 \
        gir1.2-gstreamer-1.0 \
        gir1.2-gtk-3.0 \
        gir1.2-gtksource-3.0 \
        gir1.2-keybinder-3.0 \
        gir1.2-soup-2.4 \
        gir1.2-webkit2-4.0 \
        gstreamer1.0-plugins-bad \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-ugly \
        gstreamer1.0-pulseaudio \
        libxine2 \
        python3-feedparser \
        python3-gi \
        python3-gi-cairo \
        python3-musicbrainzngs \
        python3-mutagen \
        python3-mypy \
        python3-pip \
        python3-polib \
        python3-pyinotify \
        python3-pytest \
        python3-setuptools \
        xvfb

RUN python3 -m pip install --user --upgrade \
        xvfbwrapper \
        pytest-faulthandler \
        flake8

# Create user (required for write access tests in 'tests/test_formats__audio.py' to pass)
ARG HOST_USER_ID=5555
ENV HOST_USER_ID ${HOST_USER_ID}
RUN useradd -u $HOST_USER_ID -ms /bin/bash user

# Required to prevent pytest from running into permissions errors when creating
# cache files in GITHUB_WORKSPACE as 'user'
ENV PYTHONDONTWRITEBYTECODE 1

# required for translation tests that use 'gettext'
ENV LANG C.UTF-8

# run tests
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
