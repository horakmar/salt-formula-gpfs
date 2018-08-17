orchestrate_gpfs_node_register:
  runner.state.orchestrate:
    - mods: gpfs.orchestrate.node_register
    - queue: True
    - pillar:
        event_originator: {{ data.id }}
        event_data: {{ data.data }}
