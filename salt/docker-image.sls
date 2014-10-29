ubuntu_image:
  docker.pulled:
    - name: ubuntu:14.04
    - order: 100

malleefowl_build:
  docker.built:
    - name: malleefowl
    - path: https://raw.githubusercontent.com/bird-house/malleefowl/pingudev/Dockerfile
    - order: 101
    
malleefowl_remove:
  docker.absent:
    - name: malleefowl
    - order: 112

malleefowl_container:
  docker.installed:
    - name: malleefowl
    - image: malleefowl
    - require:
      - docker: malleefowl_build
    - order: 120

malleefowl_running:
  docker.running:
    - container: malleefowl
    - port_bindings:
      "9001/tcp":
        HostIp: "0.0.0.0"
        HostPort: "9001"
    - require:
      - docker: malleefowl_container
    - order: 121
