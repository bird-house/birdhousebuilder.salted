https://github.com/bird-house/malleefowl.git:
  git.latest:
    - rev: pingudev
    - target: /tmp/malleefowl
    - order: 50

ubuntu_image:
  docker.pulled:
    - name: ubuntu:14.04
    - order: 100

malleefowl_build:
  docker.built:
    - name: malleefowl
    - path: /tmp/malleefowl
    - order: 101
    
malleefowl_remove:
  docker.absent:
    - name: malleefowl
    - order: 112

malleefowl_container:
  docker.installed:
    - name: malleefowl
    - image: malleefowl
    - ports:
      - "9001/tcp"
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
        "8090/tcp":
            HostIp: "0.0.0.0"
            HostPort: "8090"
        "8091/tcp":
            HostIp: "0.0.0.0"
            HostPort: "8091"
        "8080/tcp":
            HostIp: "0.0.0.0"
            HostPort: "8080"
    - require:
      - docker: malleefowl_container
    - order: 121
