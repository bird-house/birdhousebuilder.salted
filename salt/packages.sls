vim-enhanced:
  pkg:
   - installed

docker:
  pkg:
   - name: docker-io
   - installed
  service:
   - running
   - require:
     - pkg: docker

python-docker-py:
  pkg:
   - installed
