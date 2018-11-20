system_icons_dir = join_paths(datadir, 'icons', 'hicolor')

icon_22_files = files(
  '22x22/apps/dropboxstatus-blank.svg',
  '22x22/apps/dropboxstatus-busy.svg',
  '22x22/apps/dropboxstatus-busy2.svg',
  '22x22/apps/dropboxstatus-idle.svg',
  '22x22/apps/dropboxstatus-logo.svg',
  '22x22/apps/dropboxstatus-x.svg',
)

install_data(icon_22_files,
  install_dir: join_paths(system_icons_dir, 'scalable', 'apps')
)

install_subdir('hicolor',
  install_dir: system_icons_dir,
)

