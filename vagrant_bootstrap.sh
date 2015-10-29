#!/bin/bash

alias python='/usr/bin/python3.4'
export PYTHONPATH=/usr/lib/python3.4

echo 'Installing git, python3-pip, nginx, supervisor'
sudo apt-get -qq install git python3-pip nginx supervisor > /dev/null

echo 'Installing postgres...'
sudo apt-get -qq install postgresql postgresql-contrib postgresql-server-dev-all > /dev/null

echo 'Installing virtualenv and virtualenvwrapper with pip3'
alias python='/usr/bin/python3.4'
pip3 install --quiet virtualenv
pip3 install --quiet virtualenvwrapper
mkdir ~vagrant/.virtualenvs
chown vagrant:vagrant ~vagrant/.virtualenvs
printf "\n\n# Virtualenv settings\n" >> ~vagrant/.bashrc
printf "export PYTHONPATH=/usr/lib/python3.4" >> ~vagrant/.bashrc
printf "export WORKON_HOME=~vagrant/.virtualenvs\n" >> ~vagrant/.bashrc
printf "export PROJECT_HOME=/vagrant\n" >> ~vagrant/.bashrc
printf "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4\n" >> ~vagrant/.bashrc
printf "source /usr/local/bin/virtualenvwrapper.sh\n" >> ~vagrant/.bashrc

echo 'Config files for nginX & gunicorn'
cp /vagrant/configs/supervisor-gunicorn /etc/supervisor/conf.d/gunicorn.conf
mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old
cp /vagrant/configs/nginx-default /etc/nginx/sites-available/default

echo ""
echo "Vagrant install complete."
