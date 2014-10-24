docker_index_image:
  docker.pulled:
    - name: ubuntu:14.04
    - force: True
    - order: 100

docker_index_stop_if_old:
  cmd.run:
    - name: docker stop ubuntu
    - require:
      - docker: docker_index_image
    - order: 111

docker_index_remove_if_old:
  cmd.run:
    - name: docker rm ubuntu
    - require:
      - cmd: docker_index_stop_if_old
    - order: 112

docker_index_container:
  docker.installed:
    - name: ubuntu
    - image: ubuntu:14.04
    - require:
      - docker: docker_index_image
    - order: 120

docker_index_running:
  docker.running:
    - container: ubuntu 
    - require:
      - docker: docker_index_container
    - order: 121
