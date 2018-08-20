{%- set node_name = salt['pillar.get']('event_originator', none) %}
{%- set data = salt['pillar.get']('event_data', none) %}
{%- if data and data['client_name'] %}
{%-   set client_name = data['client_name'] %}
{%- else %}
{%-   set client_name = node_name %}
{%- endif %}

register_node:
  salt.function:
    - name: cmd.run
    - tgt: gpftcl1.cezdata.corp
    - arg:
      - 'su qpspectrum "-c sudo /usr/lpp/mmfs/bin/mmaddnode -N {{ client_name }}:client"; /usr/lpp/mmfs/bin/mmchlicense client --accept -N {{ client_name }};'
    - kwarg:
        unless: 'su qpspectrum "-c sudo /usr/lpp/mmfs/bin/mmlsnode -N {{ client_name }}"'

set_grain:
  salt.function:
    - name: grains.set
    - tgt: {{ node_name }}
    - arg:
      - gpfs_registered
      - {{ client_name }}

gpfs_service_state:
  salt.state:
    - tgt: {{ node_name }}
    - sls: gpfs.service
    - queue: True
    - require:
      - salt: register_node
