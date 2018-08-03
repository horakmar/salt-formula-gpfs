{%- from "gpfs/map.jinja" import gpfs with context %}

gpfs_packages:
  pkg.installed:
  - pkgs: {{ gpfs.pkgs }}

gpfs_doc_packages:
  pkg.installed:
  - pkgs: {{ gpfs.docpkgs }}

ksh_package:
  pkg.installed:
  - name: ksh

build_packages:
  pkg.installed:
  - pkgs: {{ gpfs.buildpkgs }}

mmfs_path:
  file.append:
  - name: /home/{{ gpfs.system_user }}/.profile
  - text: "# Append GPFS directory to the PATH\nif [ -d /usr/lpp/mmfs/bin ]; then\n    PATH=$PATH:/usr/lpp/mmfs/bin\nfi"

modules_build:
  cmd.run:
  - name: mmbuildgpl
  - prepend_path: /usr/lpp/mmfs/bin
