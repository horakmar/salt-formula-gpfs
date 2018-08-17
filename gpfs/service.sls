{%- from "gpfs/map.jinja" import gpfs with context %}

gpfs_service:
  service.running:
  - name: {{ gpfs.service }}
  - enable: true
