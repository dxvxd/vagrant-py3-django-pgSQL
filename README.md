# Vagrant with python 3, django and postgres

Important note:

In configuration files and everywhere you see **project_name**, replace it with more comfortable name (without underscores)!


## Follow the steps

In shell you go to desired, freshly made project dir and clone this repository.

In shell you do:
```
vagrant up
```
Then wait. Go drink a cup of coffee. Vagrant box will be downloaded, then configured.

When you see message `Vagrant install complete.` type the following words:
```
vagrant ssh
```
You logged in virtual machine. Now it's time for new destination:
```
cd /vagrant
```
This location (`/vagrant`) is mapped to the current dir from where you started typing `vagrant up` (project home dir).

Make python virtual environment with:
```
mkvirtualenv project_name
```
Then install needed tools:
```
pip3 install django-toolbelt
```
And finaly, start django project:
```
django-admin startproject project_name
```

Restart nginX and supervisor:
```
sudo service supervisor restart
sudo service nginx restart
```

On host machine, fill the /etc/hosts with one more line:
```
192.168.99.100	project_name.dev
```

Open browser, go to the http://project_name.dev and you should see django error page.

## Postgres setup

This should be very simple. Inside your vagrant box just type following:
```
sudo -u postgres psql postgres
```

You are in postgres client console now. Set password for _postgres_ user:
```
\password postgres
```
Answer obvius questions by typing letters not to be seen, and then quit by typing `\q`.

Create project database with:
```
sudo -u postgres createdb <project_database_name>
```

That's all.
