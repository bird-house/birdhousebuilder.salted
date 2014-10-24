ubuntu_image:
  docker.pulled:
    - name: ubuntu:14.04
    - force: True
    - order: 100

birdhouse_build:
  docker.built:
    - name: birdhouse:dev
    - path: https://raw.githubusercontent.com/bird-house/malleefowl/pingudev/Dockerfile
    - order: 101
    
birdhouse_remove:
  docker.absent:
    - name: birdhouse
    - order: 112

birdhouse_container:
  docker.installed:
    - name: birdhouse
    - image: birdhouse:dev
    - require:
      - docker: birdhouse_build
    - order: 120

birdhouse_running:
  docker.running:
    - container: birdhouse 
    - require:
      - docker: birdhouse_container
    - order: 121
