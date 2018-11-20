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
* License along with this program; if not,see <http://www.gnu.org/licenses/>.
*
*/

public class Dropbox.Indicator : Wingpanel.Indicator {
  private Wingpanel.Widgets.OverlayIcon? indicator_icon = null;
  private Dropbox.Widgets.PopoverWidget? popover_wigdet = null;

  public Indicator () {
    debug("Hello from wingpanel-indicator-dropbox");
    Object (
      code_name: "wingpanel-indicator-dropbox",
      display_name: _("Dropbox"),
      description: _("The dropbox indicator")
    );
  }

  construct {
    visible = true;
  }

  public override Gtk.Widget get_display_widget () {
    if(indicator_icon == null) {
      indicator_icon = new Wingpanel.Widgets.OverlayIcon ("dialog-information-symbolic");
    }

    indicator_icon.button_press_event.connect ((e) => {
      // todo change
      return Gdk.EVENT_PROPAGATE;
    });
    return indicator_icon;
  }

  public override Gtk.Widget? get_widget () {
    // todo implement
    if (popover_wigdet == null) {
      popover_wigdet = new Dropbox.Widgets.PopoverWidget ();
    }
    return popover_wigdet;
  }

  public override void opened () {}

  public override void closed () {}
}

/*
 * This method is called once after your plugin has been loaded.
 * Create and return your indicator here if it should be displayed on the current server.
 */
public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    /* A small message for debugging reasons */
    debug ("Activating Sample Indicator");

    /* Check which server has loaded the plugin */
    // if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
    //     /* We want to display our sample indicator only in the "normal" session, not on the login screen, so stop here! */
    //     return null;
    // }

    /* Create the indicator */
    var indicator = new Dropbox.Indicator ();

    /* Return the newly created indicator */
    return indicator;
}
