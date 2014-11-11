nginx-pkgs:
  pkg:
    - latest
    - names:
      - nginx

/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
{% if grains['os_family'] == 'RedHat' %}
    - nginx_user: nobody
{% elif grains['os_family'] == 'Debian' %}
    - nginx_user: www-data
{% endif %}
    - require:
      - pkg: nginx-pkgs

mkcert.sh:
  cmd.script:
    - source: salt://nginx/mkcert.sh
    - template: jinja
    - subject: {{ pillar['subject']}}
    - cert: /etc/nginx/proxy.cert

/etc/nginx/sites-enabled/proxy:
  file.managed:
    - source: salt://nginx/proxy.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - hostname: {{ pillar['fqdn'] }}
    - makedirs: True
    - require:
      - pkg: nginx-pkgs

/etc/nginx/sites-enabled:
  file:
    - directory
    - clean: True
    - require:
      - file: /etc/nginx/sites-enabled/proxy

nginx:
  service:
    - running
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-enabled/proxy
