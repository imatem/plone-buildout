#!/bin/sh

# see https://community.plone.org/t/not-using-bootstrap-py-as-default/620
rm -r ./lib ./include ./bin
virtualenv-3.7 .
./bin/pip install -r requirements.txt
./bin/buildout
