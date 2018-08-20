{%- set node_name = salt['pillar.get']('event_originator', none) %}
{%- set data = salt['pillar.get']('event_data', none) %}
{%- if data and data['client_name'] != 'None' and data['client_name'] != 'none' %}
{%-   set client_name = data['client_name'] %}
{%- else %}
{%-   set client_name = node_name %}
{%- endif %}

register_node:
  salt.state:
    - tgt: gpftcl1.cezdata.corp
    - sls: gpfs.server.register_client
    - queue: True
    - pillar:
        client_name: {{ client_name }}

set_grain:
  salt.function:
    - name: grains.set
    - tgt: {{ node_name }}
    - arg:
      - gpfs_registered
      - {{ client_name }}
    - require:
      - salt: register_node

gpfs_service_state:
  salt.state:
    - tgt: {{ node_name }}
    - sls: gpfs.service
    - queue: True
    - require:
      - salt: register_node
