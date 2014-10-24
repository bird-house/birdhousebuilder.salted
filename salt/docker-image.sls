ubuntu_image:
  docker.pulled:
    - name: ubuntu:14.04
    - force: True
    - order: 100

ubuntu_remove:
  docker.absent:
    - name: ubuntu
    - order: 112

ubuntu_container:
  docker.installed:
    - name: ubuntu
    - image: ubuntu:14.04
    - require:
      - docker: ubuntu_image
    - order: 120

ubuntu_running:
  docker.running:
    - container: ubuntu 
    - require:
      - docker: ubuntu_container
    - order: 121
