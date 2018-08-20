{%- set client_name = salt['pillar.get']('client_name') %}

register_client:
  cmd.run:
    - name: 'su qpspectrum "-c sudo /usr/lpp/mmfs/bin/mmaddnode -N {{ client_name }}:client"; /usr/lpp/mmfs/bin/mmchlicense client --accept -N {{ client_name }};'
    - unless: 'su qpspectrum "-c sudo /usr/lpp/mmfs/bin/mmlsnode -N {{ client_name }}"'

