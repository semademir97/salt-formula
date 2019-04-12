We want to config every CentOS 7 Servers using Salt. <br>

I write these codes only CentOS Servers but if you have Debian or something server, you can search Jinja. Add a few commands for example: <br>

{% if grains.os_family=='Debian' %}<br>

.... <br>
{%  endif %} <br> 

You need OpenDJ, LDAP Server, Apache Directory, Salt Master and Salt Minions. <br>
Parameters like ou, dc ... is in your LDAP Schema. For these configs (OpenDJ and LDAP) visiy my web site : www.semademir.com<br>
Don't forget to download and installation Apache Directory. <br>
When you connect all of them, you should use these configs according to your Schema.<br>
Then run the commands!
<br>

Steps: 
<br>
ldap-login.sls on the server.  (Physical computer) <br>
the other files are on the client. (Virtual Machine)<br>
ldap-login.sls is Salt Formula file<br>

running: salt 'minion's name' state.apply ldap-login <br>

I don't know how we run these commands without SElinux = disabled. Still searching ...
