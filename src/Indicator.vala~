/*
* Copyright (c) 2011-2018 Ivan Vilanculo (https://ivan.vilanculo.me)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Ivan Vilanculo <vilanculoivan@gmail.com>
*/

public class App : Gtk.Application {
  public App () {
    Object (
      application_id: "com.github.isneezy.wingpanel-indicator-dropbox",
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  protected override void activate () {
    var button_hello = new Gtk.Button.with_label ("Click me!");
    button_hello.margin = 12;
    button_hello.clicked.connect(() => {
      button_hello.label = "Hello World";
      button_hello.sensitive = false;
    });
    var main_window = new Gtk.ApplicationWindow (this);
    main_window.default_height = 300;
    main_window.default_width = 300;
    main_window.title = "Hello World";
    main_window.add (button_hello);
    main_window.show_all();
  }

  public static int main (string[] args) {
    var app = new App();
    return app.run (args);
  }
}
