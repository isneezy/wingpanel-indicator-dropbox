# project name and programming language
project(
  'com.github.isneezy.wingpanel-indicator-dropbox',
  'vala', 'c',
  version: '0.1.0'
)

prefix = get_option('prefix')
datadir = join_paths(prefix, get_option('datadir'))

gettext_name = meson.project_name() + '-indicator'
gnome = import('gnome')
i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format(gettext_name), language:'c')

wingpanel_dep = dependency('wingpanel-2.0')

shared_module(
    meson.project_name(),
    'src/Indicator.vala',
    'src/Widgets/PopoverWidget.vala',
    'src/Services/Dropbox.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        # dependency('glib-2.0'),
        # dependency('gio-2.0'),
        wingpanel_dep
    ],
    install: true,
    install_dir: wingpanel_dep.get_pkgconfig_variable('indicatorsdir')
)


#Install our .appdata.xml file so AppCenter will see it
install_data(
    join_paths('data', meson.project_name() + '.appdata.xml'),
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)

subdir('icons')
