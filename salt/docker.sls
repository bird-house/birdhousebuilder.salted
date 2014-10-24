docker:
  pkg:
    - installed
    {% if grains['os_family'] == 'RedHat' %}
    - name: docker-io
    {% elif grains['os'] == 'Ubuntu' %}
    - name: docker.io
    {% elif grains['os_family'] == 'Debian' %}
    - name: lxc-docker
    {% endif %}
  service:
    {% if grains['os_family'] == 'RedHat' %}
    - name: docker
    {% elif grains['os'] == 'Ubuntu' %}
    - name: docker.io
    {% elif grains['os_family'] == 'Debian' %}
    - name: docker
    {% endif %}
    - running
    - require:
      - pkg: docker

docker-py:
  pip:
    - installed
