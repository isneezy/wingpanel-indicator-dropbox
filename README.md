# Wingpanel Dropbox Indicator

![Screenshot](data/screenshot.png?raw=true)

## Building and Installation

You'll need the following dependencies:

- gtk+-3.0
- glib-2.0
- gio-2.0
- libwingpanel-2.0-dev
- meson
- valac

Run `meson` to configure the build environment and then `ninja` to build

```
  meson build --prefix=/usr
  cd build
  ninja
```

To install, use `ninja install`

sudo ninja install
