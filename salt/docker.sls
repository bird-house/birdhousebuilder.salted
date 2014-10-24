docker:
  pkg:
    - installed
    {% if grains['os_family'] == 'RedHat' %}
    - name: docker-io
    {% elif grains['os'] == 'Ubuntu' %}
    - name: docker.io
    {% endif %}
  service:
    {% if grains['os_family'] == 'RedHat' %}
    - name: docker
    {% elif grains['os'] == 'Ubuntu' %}
    - name: docker.io
    {% endif %}
    - running
    - require:
      - pkg: docker

docker-py:
  pip:
    - installed
