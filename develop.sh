#!/bin/bash

VENV="/home/herisanu/Work/graphite-web"

if [[ ! -d ${VENV} ]]; then
  virtualenv --distribute --no-site-packages ${VENV}
  source ${VENV}/bin/activate
  pip install --upgrade pip
  pip install --upgrade setuptools
  pip install -r requirements.txt
  pip install ldap pyhash
  ./check-dependencies.py
else
  source ${VENV}/bin/activate
fi

python setup.py install --prefix="${VENV}/graphite" --install-lib="${VENV}/lib/python2.7/site-packages" --install-data="${VENV}/graphite"
