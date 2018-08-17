{%- set node_name = salt['pillar.get']('event_originator', 'none') %}

register_node:
  salt.function:
    - name: cmd.run
    - tgt: gpftcl1.cezdata.corp
    - arg:
      - 'if ! /usr/lpp/mmfs/bin/mmlsnode -N {{ node_name }} >/dev/null 2>&1; then su qpspectrum "-c sudo /usr/lpp/mmfs/bin/mmaddnode -N {{ node_name }}:client"; /usr/lpp/mmfs/bin/mmchlicense client --accept -N {{ node_name }}; fi'

gpfs_service_state:
  salt.state:
    - tgt: '{{ node_name }}'
    - sls: gpfs.service
    - queue: True
    - require:
      - salt: register_node
