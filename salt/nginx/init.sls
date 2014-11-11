/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 644

/etc/nginx/sites-enabled/proxy:
  file.managed:
    - source: salt://nginx/proxy.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        hostname: localhost

mkcert.sh:
  cmd.script:
    - source: salt://nginx/mkcert.sh
    - template: jinja
    - subject: /C=DE/O=MyCompany/OU=MyOrg/CN=localhost
    - cert: /etc/nginx/proxy.cert
        
nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf