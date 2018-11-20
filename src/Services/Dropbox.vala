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

public class Dropbox.Services.Service {
  public Service () {}

  private string get_pid_file_path () {
    return GLib.Environment.get_home_dir () + "/.dropbox/dropbox.pid";
  }

  private string get_pid () {
    string pid;
    var pid_file = File.new_for_path(get_pid_file_path());
    if (!pid_file.query_exists ()) {
      return "";
    }
    try {
        FileInputStream @is = pid_file.read ();
        DataInputStream dis = new DataInputStream (@is);
        pid = dis.read_line ();
        return pid;
    } catch (Error e) {
      debug("Error " + e.message);
      return "";
    }
  }

  public bool is_dropbox_running () {
    var proc_file = File.new_for_path("/proc/" + get_pid() + "/cmdline");
    return proc_file.query_exists ();
  }
}

// void main (string[] args) {
//   Dropbox.Services.Service service = new Dropbox.Services.Service ();
//   if (service.is_dropbox_running()) {
//     stdout.printf ("Dropbox is running!\n");
//   } else {
//     stderr.printf ("Dropbox is'nt running!\n");
//   }
// }
