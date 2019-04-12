install-required-packages:
  pkg.installed:
    - pkgs:
      - nss-pam-ldapd
      - authconfig
      - openldap-clients
      - nscd

config-nslcd-file:
  file.managed:
    - name: '/etc/nslcd.conf'
    - source: salt://ldap/nslcd.conf
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - context:
        uri: "ldap://xx.xx.xx.xx:1389"
        base: "dc=xxx,dc=com"
        binddn: "cn=xxx"
        bindpw: "xxx"
        base_group: "ou=posix, dc=xxx,dc=com"
        base_passwd: "ou=users, dc=xxx,dc=com"
        base_shadow: "ou=users, dc=xxx,dc=com"
        filter_passwd: "(&(objectClass=posixAccount)(host=$HOSTNAME))"

config-nsswitch-file:
  file.managed:
    - name: '/etc/pam.d/password-auth'
    - source: salt://ldap/password-auth
    - user: root
    - group: root
    - mode: 777
    - template: jinja

config-system-auth-ac:
  file.managed:
    - name: '/etc/pam.d/system-auth-ac'
    - source: salt://ldap/system-auth-ac
    - user: root
    - group: root
    - mode: 644
    - template: jinja

config-nsswitch:
  file.managed:
    - name: '/etc/nsswitch.conf'
    - source: salt://ldap/nsswitch.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    
config-auth:
  file.managed:
    - name: '/etc/sysconfig/authconfig'
    - source: salt://ldap/authconfig
    - user: root
    - group: root
    - mode: 644
    - template: jinja

config-selinux:
  file.managed:
    - name: '/etc/selinux/config'
    - source: salt://ldap/selinux_config
    - user: root
    - group: root
    - mode: 644
    - template: jinja

enable-run-nscd:
  service.running:
    - name: nscd
    - reload: True
    - enable: True

enable-run-nslcd:
  service.running:
    - name: nslcd
    - reload: True
    - enable: True

