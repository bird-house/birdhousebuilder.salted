vim:
  pkg:
    - installed
    {% if grains['os_family'] == 'RedHat' %}
    - name: vim-enhanced
    {% elif grains['os'] == 'Ubuntu' %}
    - name: vim-nox
    {% endif %}

python-pip:
  pkg.installed

git:
  pkg.installed

bash:
  pkg.installed

tmux:
  pkg.installed

byobu:
  pkg.installed

etckeeper:
  pkg.installed

