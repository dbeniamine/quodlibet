#!/bin/bash
dbus-daemon --session &
PYTEST_ADDOPTS=-rxXs python3 setup.py test
