# Vagrant with python 3, django and postgres
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
